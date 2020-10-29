//
//  BlockViewModel.swift
//
//  Created by Tin Jurković on 31/10/2020.
//  Copyright © 2020 Tin Jurković. All rights reserved.
//

import UIKit

class BlockViewModel: BaseViewModel {
    var onReloadData: EmptyCallback?
    var onGoToAddBlockedNumber: EmptyCallback?
    
    var phoneNumbers: [String] = [] {
        didSet {
            onReloadData?()
        }
    }

    override init() {
        super.init()
        getBlockListPhoneNumbers()
        NotificationCenter.default.addObserver(self, selector: #selector(getBlockListPhoneNumbers), name: .phoneNumberBlockListUpdated, object: nil)
    }
    
    func getPhoneNumbersCount() -> Int {
        return phoneNumbers.count
    }
    
    func getPhoneNumber(index: Int) -> String {
        return phoneNumbers[index]
    }
    
    func remove(index: Int) {
        SuspiciousList.shared.remove(phoneNumber: phoneNumbers[index])
    }
    
    @objc func getBlockListPhoneNumbers() {
        phoneNumbers = SuspiciousList.shared.getPhoneNumbers() ?? []
        phoneNumbers.reverse()
    }
    
    func goToAddBlockedNumber() {
        onGoToAddBlockedNumber?()
    }
}
