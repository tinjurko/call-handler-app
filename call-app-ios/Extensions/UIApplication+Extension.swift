//
//  UIApplication+Extension.swift
//
//  Created by Tin Jurković.
//  Copyright © 2020 Tin Jurković. All rights reserved.
//

import UIKit

extension UIApplication {
    class var topViewController: UIViewController? { return getTopViewController() }
    
    private class func getTopViewController() -> UIViewController? {
        let keyWindow = UIApplication.shared.windows.filter {$0.isKeyWindow}.first

        if var topController = keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }

            return topController
        }
        
        return nil
    }
}
