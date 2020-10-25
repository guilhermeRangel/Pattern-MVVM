//
//  HomeViewController.swift
//  Pattern-MVVM
//
//  Created by Guilherme Rangel on 24/10/20.
//

import Foundation
import UIKit
class HomeViewController: UIViewController, Storyboarded {
    weak var coordinator: MainCoordinator?
    var viewModel = HomeViewModel()
    let myGroup = DispatchGroup()
    
    @IBAction func btnDetails(_ sender: UIButton) {
//        self.coordinator?.goToDetails()
        viewModel.fetch()
   
       
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.homeService.homeServiceDelegate = self
        self.view.backgroundColor = .red
     
    }
}

extension HomeViewController: HomeServiceDelegate{
    func onHomeFetched(_ result: [Events]) {
        viewModel.modelHomeEvents.result = result
    }
    
 
    
    
}
