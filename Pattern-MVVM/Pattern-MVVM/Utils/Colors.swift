//
//  Colors.swift
//  Pattern-MVVM
//
//  Created by Guilherme Rangel on 24/10/20.
//

import Foundation
import UIKit

enum Colors {
    
    static var white: UIColor {
        let hexColor = "FFFFFF"
        guard let color =  UIColor(fromHexCode: hexColor) else { fatalError("Should return a color of \(hexColor)") }
        return color
    }
    
    static var green: UIColor {
        return UIColor.init(red: 0.125, green: 0.608, blue: 0.525, alpha: 1)
    }

}
