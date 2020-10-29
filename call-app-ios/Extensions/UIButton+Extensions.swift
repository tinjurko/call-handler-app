//
//  UIButton+Extensions.swift
//  call-app-ios
//
//  Created by Tin Jurković on 01/11/2020.
//

import UIKit

enum ButtonStyleType {
    case filled
    case border
}

extension UIButton {
    func setStyle(_ style: ButtonStyleType, color: UIColor, title: String, titleColor: UIColor, titleFontSize: CGFloat = 14) {
        switch style {
        case .filled:
            self.filledStyle(color: color, title: title, titleColor: titleColor, fontSize: titleFontSize)
        case .border:
            self.borderStyle(color: color, title: title, titleColor: titleColor, fontSize: titleFontSize)
        }
    }
    
    func enable(_ style: ButtonStyleType, fillColor: UIColor, textColor: UIColor = .white) {
       switch style {
        case .filled:
            self.backgroundColor = fillColor
        case .border:
            self.layer.borderColor = fillColor.cgColor
        }
        
        self.setTitleColor(textColor, for: .normal)
        self.isEnabled = true
    }
    
    func disable(_ style: ButtonStyleType, textColor: UIColor = .grey3) {
        switch style {
        case .filled:
            self.backgroundColor = .grey4
        case .border:
            self.layer.borderColor = UIColor.grey3.cgColor
        }
        
        self.setTitleColor(textColor, for: .normal)
        self.isEnabled = false
    }
    
    private func filledStyle(color: UIColor, title: String, titleColor: UIColor, fontSize: CGFloat) {
        self.layer.cornerRadius = 6
        self.backgroundColor = color
        self.setTitle(title, for: .normal)
        self.titleLabel?.font = Font.semiBold.size(fontSize)
        self.setTitleColor(titleColor, for: .normal)
        self.tintColor = titleColor
    }
    
    private func borderStyle(color: UIColor, title: String, titleColor: UIColor, fontSize: CGFloat) {
        self.layer.cornerRadius = 6
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = 1
        self.backgroundColor = .clear
        self.setTitle(title, for: .normal)
        self.titleLabel?.font = Font.semiBold.size(fontSize)
        self.setTitleColor(titleColor, for: .normal)
        self.tintColor = titleColor
    }
}
