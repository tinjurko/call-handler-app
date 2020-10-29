//
//  Call.swift
//  call-app-ios
//
//  Created by Tin Jurković on 31/10/2020.
//

import Foundation

class Call {
  let uuid: UUID
  let outgoing: Bool
  let handle: String
  
  var state: CallState = .ended {
    didSet {
      stateChanged?()
    }
  }
  
  var connectedState: ConnectedState = .pending {
    didSet {
      connectedStateChanged?()
    }
  }
  
  var stateChanged: (() -> Void)?
  var connectedStateChanged: (() -> Void)?
  
  init(uuid: UUID, outgoing: Bool = false, handle: String) {
    self.uuid = uuid
    self.outgoing = outgoing
    self.handle = handle
  }
  
  func start(completion: ((_ success: Bool) -> Void)?) {
    completion?(true)

    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
      self.state = .connecting
      self.connectedState = .pending
      
      DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
        self.state = .active
        self.connectedState = .complete
      }
    }
  }
  
  func answer() {
    state = .active
  }
  
  func end() {
    state = .ended
  }
}
