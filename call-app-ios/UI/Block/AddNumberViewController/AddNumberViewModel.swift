//
//  AddNumberViewModel.swift
//  call-app-ios
//
//  Created by Tin Jurković on 02/11/2020.
//

import UIKit

class AddNumberViewModel: BaseViewModel {
    func addNumberToBlockList(numberString: String) {
        SuspiciousList.shared.addPhoneNumber(numberString: numberString)
    }
}
