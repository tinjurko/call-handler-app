//
//  Colors.swift
//
//  Created by Tin Jurković
//  Copyright © 2020 Tin Jurković. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    static func rgb(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat, _ alpha: CGFloat = 1.0) -> UIColor {
        return UIColor(red: red / 255.0, green: green / 255.0, blue: blue / 255.0, alpha: alpha)
    }
    
    //Semantic
    static let gateRed = rgb(187, 52, 47)
    static let polishedGreen = rgb(87, 163, 144)
    static let dodgerBlue = rgb(33, 145, 251)
    
    //Neutral
    static let neutralDark = rgb(24, 25, 26)
    static let grey1 = rgb(95, 97, 103)
    static let grey2 = rgb(148, 149, 153)
    static let grey3 = rgb(184, 184, 189)
    static let grey4 = rgb(242, 242, 247)
    
}
