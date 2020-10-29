//
//  PhoneNumberFormatter.swift
//  call-app-ios
//
//  Created by Tin Jurković on 02/11/2020.
//

import CallKit

class PhoneNumberFormatter {
    static func phoneNumber(for string: String) -> CXCallDirectoryPhoneNumber? {

        let sanitized = PhoneNumberFormatter.sanitizedPhoneNumberString(numberString: string)

        return CXCallDirectoryPhoneNumber(sanitized)
    }

    // Removing characters which are not digits
    static private func sanitizedPhoneNumberString(numberString: String) -> String {
        let numberDigits = String(numberString.filter { String($0).rangeOfCharacter(from: CharacterSet.decimalDigits) != nil })
        let digitsMax = 15
        let numberDigitsPrefix = String(numberDigits.prefix(digitsMax))
        
        return numberDigitsPrefix
    }
}
