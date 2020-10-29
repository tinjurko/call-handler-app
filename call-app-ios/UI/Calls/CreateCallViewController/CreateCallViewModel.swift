//
//  CreateCallViewModel.swift
//  call-app-ios
//
//  Created by Tin Jurković on 01/11/2020.
//

import UIKit

protocol CreateCallDelegate: class {
    func initCall(data: [String: Any])
}

class CreateCallViewModel: BaseViewModel {
    var delegate: CreateCallDelegate?
    
    func createCall(number: String, isIncoming: Bool, hasVideo: Bool) {
        let data: [String: Any] = [
            "number": number,
            "isIncoming": isIncoming,
            "hasVideo": hasVideo
        ]
        
        //NotificationCenter.default.post(name: .onCreateCall, object: nil, userInfo: info)
        delegate?.initCall(data: data)
    }
}
