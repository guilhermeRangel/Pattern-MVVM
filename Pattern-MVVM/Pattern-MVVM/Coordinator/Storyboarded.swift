//
//  Storyboarded.swift
//  Pattern-MVVM
//
//  Created by Guilherme Rangel on 24/10/20.
//

import Foundation
import UIKit

protocol Storyboarded {
    static func instantiate(_ storyboard: String, id: String) -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instantiate(_ storyboard: String, id: String) -> Self {
        let storyboard = UIStoryboard(name: storyboard, bundle: Bundle.main)
        if let instance = storyboard.instantiateViewController(withIdentifier: id) as? Self {
            return instance
        } else {
            fatalError("Failed to instantiate View Controller")
        }
    }
}

