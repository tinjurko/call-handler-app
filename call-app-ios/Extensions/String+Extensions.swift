//
//  String+Extensions.swift
//  call-app-ios
//
//  Created by Tin Jurković on 02/11/2020.
//

import Foundation

extension String {
    var hasNumber: Bool {
        let decimalRange = self.rangeOfCharacter(from: CharacterSet.decimalDigits)

        if decimalRange != nil {
            return true
        }
        
        return false
    }
}
