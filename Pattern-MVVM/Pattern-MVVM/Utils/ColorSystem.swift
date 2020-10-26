//
//  ColorSystem.swift
//  Pattern-MVVM
//
//  Created by Guilherme Rangel on 25/10/20.
//

import Foundation
import UIKit

class ColorSystem {
    static var backgroundCard:UIColor {
        return UIColor(named: "BackgroundCard") ?? .gray
    }
    
    static var defaultBackgroundColor: UIColor{
        return UIColor.init(named: "DefaultBackgroundColor") ?? .gray
    }

    static var defaultElementeCell:UIColor {
        return UIColor(named: "DefaultElementeCell") ?? .gray
    }
    static var defaultElementsColor:UIColor {
        return UIColor(named: "DefaultElementsColor") ?? .gray
    }
    

    
    
    
    func getColor(name: String) -> UIColor{
        return UIColor.init(named: name) ?? .gray
    }
    
}
