//
//  BlockList.swift
//  call-app-ios
//
//  Created by Tin Jurković on 02/11/2020.
//

import Foundation
import CallKit

class SuspiciousList {
    private static let groupIdentifier = "group.co.tin.private-telt.call-app-ios"
    private static let extensionIdentifier = "co.tin.private-telt.call-app-ios.CallAppDirectory"
    
    static let shared = SuspiciousList()
    let groupUserDefaults = UserDefaults(suiteName: groupIdentifier)
    
    func addPhoneNumber(numberString: String) {
        guard numberString.hasNumber else { return }
        
        if var phoneNumbers = getPhoneNumbers() {
            phoneNumbers.append(numberString)
            savePhoneNumbers(phoneNumbers: phoneNumbers)
            return
        }
        
        savePhoneNumbers(phoneNumbers: [numberString])
    }
    
    func remove(phoneNumber: String) {
        if var phoneNumbers = getPhoneNumbers() {
            phoneNumbers.removeAll { (string) -> Bool in
                string == phoneNumber
            }
            
            savePhoneNumbers(phoneNumbers: phoneNumbers)
            return
        }
    }
    
    func getPhoneNumbers() -> [String]? {
        guard let encodedUser = groupUserDefaults?.data(forKey: "phoneNumbersArray") else {
            return nil
        }
        
        let decodedUser = try? JSONDecoder().decode([String].self, from: encodedUser)
        return decodedUser
    }
    
    func getCDPhoneNumbersArray() -> [CXCallDirectoryPhoneNumber] {
        if let numbersStringArray = getPhoneNumbers() {
            let cdPhoneNumberArray = numbersStringArray.map { (phoneNumberString) -> CXCallDirectoryPhoneNumber in
                return PhoneNumberFormatter.phoneNumber(for: phoneNumberString)!
            }
            
            return cdPhoneNumberArray.sorted()
        }
        
        return []
    }
    
    private func savePhoneNumbers(phoneNumbers: [String]) {
        guard let encodedUser = try? JSONEncoder().encode(phoneNumbers) else { return }
        groupUserDefaults?.set(encodedUser, forKey: "phoneNumbersArray")
        NotificationCenter.default.post(name: .phoneNumberBlockListUpdated, object: nil)
        refreshCallAppExtension()
    }
    
    func refreshCallAppExtension() {
        CXCallDirectoryManager.sharedInstance.reloadExtension(withIdentifier: SuspiciousList.extensionIdentifier) { (error) in
            if let error = error {
                print("reloaded extension: \(error)")
            }
        }
    }
    
}
