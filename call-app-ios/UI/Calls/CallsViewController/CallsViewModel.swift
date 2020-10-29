//
//  HomeViewModel.swift
//
//  Created by Tin Jurković on 31/10/2020.
//  Copyright © 2020 Tin Jurković. All rights reserved.
//

import UIKit

class CallsViewModel: BaseViewModel {
    var callManager: CallManager!
    
    var onGoToCreateNewCall: EmptyCallback?
    var onReloadData: EmptyCallback?
    
    override init() {
        callManager = AppDelegate.shared.callManager
        
        super.init()
        self.setupCallbacks()
//        NotificationCenter.default.addObserver(self, selector: #selector(createCall(notification:)), name: .onCreateCall, object: nil)
    }
    
    func setupCallbacks() {
        callManager.callsChangedHandler = { [weak self] in
          guard let self = self else { return }
            self.onReloadData?()
        }
    }
    
    func getCallsCount() -> Int {
        return callManager.calls.count
    }
    
    func setHeld(for index: Int) {
        let call = getCall(index: index)
        call.state = call.state == .held ? .active : .held
        callManager.setHeld(call: call, onHold: call.state == .held)
        
        onReloadData?()
    }
    
    func endCall(for index: Int) {
        let call = getCall(index: index)
        callManager.end(call: call)
        
        onReloadData?()
    }
    
    func getCall(index: Int) -> Call {
        return callManager.calls[index]
    }
    
    func goToCreateNewCall() {
        onGoToCreateNewCall?()
    }

//    @objc private func createCall(data: [String: Any]) {
//        guard let handle = data["number"] as? String,
//              let isIncoming = data["isIncoming"] as? Bool,
//              let hasVideo = data["hasVideo"] as? Bool
//        else {
//            return
//        }
//
//        if isIncoming {
//          let backgroundTaskIdentifier = UIApplication.shared.beginBackgroundTask(expirationHandler: nil)
//
//          DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
//            AppDelegate.shared.displayIncomingCall(uuid: UUID(), handle: handle, hasVideo: hasVideo) { (_) in
//              UIApplication.shared.endBackgroundTask(backgroundTaskIdentifier)
//            }
//          }
//
//        } else {
//          callManager.startCall(handle: handle, videoEnabled: hasVideo)
//        }
//    }
}

extension CallsViewModel: CreateCallDelegate {
    func initCall(data: [String : Any]) {
        guard let handle = data["number"] as? String,
              let isIncoming = data["isIncoming"] as? Bool,
              let hasVideo = data["hasVideo"] as? Bool
        else {
            return
        }
        
        if isIncoming {
          let backgroundTaskIdentifier = UIApplication.shared.beginBackgroundTask(expirationHandler: nil)
          
          DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            AppDelegate.shared.displayIncomingCall(uuid: UUID(), handle: handle, hasVideo: hasVideo) { (_) in
              UIApplication.shared.endBackgroundTask(backgroundTaskIdentifier)
            }
          }
          
        } else {
          callManager.startCall(handle: handle, videoEnabled: hasVideo)
        }
    }
}
