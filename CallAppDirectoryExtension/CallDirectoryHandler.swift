//
//  CallDirectoryHandler.swift
//  CallAppDirectoryExtension
//
//  Created by Tin Jurković on 02/11/2020.
//

import Foundation
import CallKit

class CallDirectoryHandler: CXCallDirectoryProvider {

    override func beginRequest(with context: CXCallDirectoryExtensionContext) {
        context.delegate = self

        if context.isIncremental {
            context.removeAllBlockingEntries()
            context.removeAllIdentificationEntries()
        }
        
        let phoneNumbers = SuspiciousList.shared.getCDPhoneNumbersArray()
        
        for number in phoneNumbers {
            context.addIdentificationEntry(withNextSequentialPhoneNumber: number, label: "Suspicious Call")
        }
        
        context.addBlockingEntry(withNextSequentialPhoneNumber: 2359501212)
                
        context.completeRequest()
    }
}

extension CallDirectoryHandler: CXCallDirectoryExtensionContextDelegate {

    func requestFailed(for extensionContext: CXCallDirectoryExtensionContext, withError error: Error) {
        // An error occurred while adding blocking or identification entries, check the NSError for details.
        // For Call Directory error codes, see the CXErrorCodeCallDirectoryManagerError enum in <CallKit/CXError.h>.
        //
        // This may be used to store the error details in a location accessible by the extension's containing app, so that the
        // app may be notified about errors which occurred while loading data even if the request to load data was initiated by
        // the user in Settings instead of via the app itself.
    }

}
