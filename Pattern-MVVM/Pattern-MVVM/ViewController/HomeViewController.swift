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
    
    @IBAction func btnDetails(_ sender: UIButton) {
        self.coordinator?.goToDetails()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .red
        
    }
}
