//
//  MainCoordinator.swift
//
//  Created by Tin Jurković.
//  Copyright © 2020 Tin Jurković. All rights reserved.
//

import Foundation
import UIKit

class MainCoordinator: NSObject, Coordinator {
    
    fileprivate var childCoordinators: [Coordinator] = [CallsCoordinator(), BlockCoordinator()]
    
    @discardableResult
    func start() -> UIViewController {
        return startHome()
    }
    
    @discardableResult
    private func startHome() -> UIViewController {
        let tabBarController = createTabBarController()
        tabBarController.showAsRoot()
        
        if let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate {
            sceneDelegate.rootCoordinator = self
        }
        
        return tabBarController
    }
}

// MARK: - Main Tab bar configuration
extension MainCoordinator {
    fileprivate func tabBarItem(for coordinator: Coordinator) -> UITabBarItem {
        switch coordinator {
        case is CallsCoordinator:
            return .calls
        case is BlockCoordinator:
            return .block
        default:
            fatalError("No tab bar set for this coordinator!")
        }
    }
    
    fileprivate func createTabBarController() -> UITabBarController {
        
        let tabBarController = UITabBarController()
        
        let viewControllers = childCoordinators.map { coordinator -> UIViewController in
            
            let vc = coordinator.start()
            vc.tabBarItem = tabBarItem(for: coordinator)
            
            return vc
        }
        
        tabBarController.tabBar.isTranslucent = true
        tabBarController.tabBar.backgroundColor = UIColor.white
        tabBarController.delegate = self
        tabBarController.tabBar.backgroundImage = UIImage()
        tabBarController.viewControllers = viewControllers
        return tabBarController
    }

}

extension MainCoordinator: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return true
    }
}

