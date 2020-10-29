//
//  UITabBarItem+Extension.swift
//
//  Created by Tin Jurković.
//  Copyright © 2020 Tin Jurković. All rights reserved.
//

import Foundation
import UIKit


extension UITabBarItem {
    static var calls: UITabBarItem {
        let selectedImage = UIImage(named: "ic-call")!.withRenderingMode(.alwaysOriginal)
        let image = UIImage(named: "ic-call-gray")!.withRenderingMode(.alwaysOriginal)
        
        let item = UITabBarItem(title: nil, image: image, selectedImage: selectedImage)
        item.imageInsets = UIEdgeInsets(top: 10, left: 0, bottom: -10, right: 0)
        
        return item
    }
    
    static var block: UITabBarItem {
        let selectedImage = UIImage(named: "ic-block")!.withRenderingMode(.alwaysOriginal)
        let image = UIImage(named: "ic-block-gray")!.withRenderingMode(.alwaysOriginal)
        
        let item = UITabBarItem(title: nil, image: image, selectedImage: selectedImage)
        item.imageInsets = UIEdgeInsets(top: 10, left: 0, bottom: -10, right: 0)
        
        return item
    }
}
