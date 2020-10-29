//
//  CallManager.swift
//  call-app-ios
//
//  Created by Tin Jurković on 31/10/2020.
//

import Foundation
import CallKit

class CallManager {
  var callsChangedHandler: (() -> Void)?
  
  private(set) var calls: [Call] = []
  private let callController = CXCallController()

  func callWithUUID(uuid: UUID) -> Call? {
    guard let index = calls.firstIndex(where: { (call) -> Bool in
        call.uuid == uuid
    }) else {
        return nil
    }
    
    return calls[index]
  }
  
  func add(call: Call) {
    calls.append(call)
    
    call.stateChanged = { [weak self] in
      guard let self = self else { return }
      self.callsChangedHandler?()
    }
    
    callsChangedHandler?()
  }
  
  func remove(call: Call) {
    guard let index = calls.firstIndex(where: { (c) -> Bool in
        c === call
    }) else {
        return
    }
    
    calls.remove(at: index)
    callsChangedHandler?()
  }
  
  func removeAllCalls() {
    calls.removeAll()
    callsChangedHandler?()
  }
  
  func end(call: Call) {
    let endCallAction = CXEndCallAction(call: call.uuid)
    let transaction = CXTransaction(action: endCallAction)
    
    requestTransaction(transaction)
  }
  
  func setHeld(call: Call, onHold: Bool) {
    let setHeldCallAction = CXSetHeldCallAction(call: call.uuid, onHold: onHold)
    let transaction = CXTransaction(action: setHeldCallAction)
    
    requestTransaction(transaction)
  }
  
  func startCall(handle: String, videoEnabled: Bool) {
    let handle = CXHandle(type: .phoneNumber, value: handle)
    let startCallAction = CXStartCallAction(call: UUID(), handle: handle)
    
    startCallAction.isVideo = videoEnabled
    
    let transaction = CXTransaction(action: startCallAction)
    
    requestTransaction(transaction)
  }
  
  private func requestTransaction(_ transaction: CXTransaction) {
    callController.request(transaction) { (error) in
      if let error = error {
        print("Transaction error: \(error)")
      } else {
        print("Transaction requested successfully")
      }
    }
  }
}
