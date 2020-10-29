//
//  BlockCoordinator.swift
//
//  Created by Tin Jurković on 31/10/2020.
//  Copyright © 2020 Tin Jurković. All rights reserved.
//

import UIKit

class BlockCoordinator: Coordinator {
    private var childCoordinators: [Coordinator] = []
    private var rootCoordinator: Coordinator?
    private var navigationController = BaseNavigationController()
    
    func start() -> UIViewController {
        let vc = self.createBlockViewController()
        navigationController.viewControllers = [vc]
        return navigationController
    }
    
    func createBlockViewController() -> UIViewController {
        let viewcontroller = BlockViewController.instance()
        let viewmodel = BlockViewModel()
        
        viewcontroller.viewModel = viewmodel
        
        viewmodel.onGoToAddBlockedNumber = { [weak self] in
            guard let self = self else { return }
            let vc = self.createAddNumberViewController()
            vc.modalPresentationStyle = .overCurrentContext
            vc.modalTransitionStyle = .crossDissolve
            UIApplication.topViewController?.present(vc, animated: true, completion: nil)
        }
        
        return viewcontroller
    }
    
    func createAddNumberViewController() -> UIViewController {
        let viewcontroller = AddNumberViewController.instance()
        let viewmodel = AddNumberViewModel()
        
        viewcontroller.viewModel = viewmodel
        
        return viewcontroller
    }
    
}
