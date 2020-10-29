//
//  BaseNavigationController.swift
//
//  Created by Tin Jurković.
//  Copyright © 2020 Tin Jurković. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    func defaultLayout() {
        self.navigationBar.tintColor = .black
        self.navigationBar.barTintColor = .white
    }

}
