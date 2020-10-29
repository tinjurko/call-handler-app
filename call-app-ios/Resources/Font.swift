//
//  Font.swift
//
//  Created by Tin Jurković.
//  Copyright © 2020 Tin Jurković. All rights reserved.
//

import UIKit

enum Font: String {
    case bold
    case semiBold
    case medium
    case regular

    var name: String {
        return self.rawValue
    }
    
    func size(_ size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: weight())
    }
    
    private func weight() -> UIFont.Weight {
        switch self {
        case .bold:
            return UIFont.Weight.bold
        case .semiBold:
            return UIFont.Weight.semibold
        case .medium:
            return UIFont.Weight.medium
        case .regular:
            return UIFont.Weight.regular
        }
    }
}
