//
//  DetailsCoordinator.swift
//  Pattern-MVVM
//
//  Created by Guilherme Rangel on 24/10/20.
//

import Foundation
import UIKit

class DetailsCoordinator: Coordinator {
  
    
    
    weak var parentCoordinator: MainCoordinator?
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    let tabController = UITabBarController()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vcDetails = DetailsViewController.instantiate(Constants.Storyboard.detailsSB, id: Constants.Id.detailsId)
        vcDetails.coordinator = parentCoordinator
        navigationController.pushViewController(vcDetails, animated: true)
    }
    
    func goToDetails(viewModel: HomeViewModel, id: Int) {
        let vc = DetailsViewController.instantiate(Constants.Storyboard.detailsSB, id: Constants.Id.detailsId)
        vc.coordinator = parentCoordinator
        vc.viewModel = viewModel
        vc.idEventy = id
        navigationController.pushViewController(vc, animated: true)
    }
    
    
    func didFinish() {
        //parentCoordinator?.childDidFinish(self)
    }
}
