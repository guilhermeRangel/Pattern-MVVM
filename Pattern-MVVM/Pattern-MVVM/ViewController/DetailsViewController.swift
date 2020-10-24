//
//  DetailsViewController.swift
//  Pattern-MVVM
//
//  Created by Guilherme Rangel on 24/10/20.
//

import Foundation
import UIKit
class DetailsViewController: UIViewController, Storyboarded {
    weak var coordinator: MainCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .blue
        
    }
}
