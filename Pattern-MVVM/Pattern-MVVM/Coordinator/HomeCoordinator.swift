//
//  HomeCoordinator.swift
//  Pattern-MVVM
//
//  Created by Guilherme Rangel on 24/10/20.
//

import Foundation
import UIKit
class HomeCoordinator: Coordinator {
    
    weak var parentCoordinator: MainCoordinator?
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    let tabController = UITabBarController()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vcHome = HomeViewController.instantiate(Constants.Storyboard.homeSB, id: Constants.Id.homeId)
        vcHome.coordinator = parentCoordinator
        navigationController.pushViewController(vcHome, animated: true)
    }
    
    func goToHome() {
        let vc = HomeViewController.instantiate(Constants.Storyboard.homeSB, id: Constants.Id.homeId)
        vc.coordinator = parentCoordinator
        navigationController.pushViewController(tabController, animated: true)
    }
    
    
    func didFinish() {
        parentCoordinator?.childDidFinish(self)
    }
}
