//
//  HomeCoordinator.swift
//
//  Created by Tin Jurković on 31/10/2020.
//  Copyright © 2020 Tin Jurković. All rights reserved.
//

import UIKit

class CallsCoordinator: Coordinator {
    private var childCoordinators: [Coordinator] = []
    private var rootCoordinator: Coordinator?
    private var navigationController = BaseNavigationController()
    
    func start() -> UIViewController {
        let vc = self.createCallsViewController()
        navigationController.viewControllers = [vc]
        return navigationController
    }
    
    func createCallsViewController() -> UIViewController {
        let viewcontroller = CallsViewController.instance()
        let viewmodel = CallsViewModel()
        
        viewcontroller.viewModel = viewmodel
        
        viewmodel.onGoToCreateNewCall = { [weak self] in
            guard let self = self else { return }
            let vc = self.createCreateCallViewController(delegate: viewmodel)
            vc.modalPresentationStyle = .overCurrentContext
            vc.modalTransitionStyle = .crossDissolve
            UIApplication.topViewController?.present(vc, animated: true, completion: nil)
        }
        
        return viewcontroller
    }
    
    func createCreateCallViewController(delegate: CreateCallDelegate) -> UIViewController {
        let viewcontroller = CreateCallViewController.instance()
        let viewmodel = CreateCallViewModel()
        viewmodel.delegate = delegate
        
        viewcontroller.viewModel = viewmodel
        
        return viewcontroller
    }
    
}
