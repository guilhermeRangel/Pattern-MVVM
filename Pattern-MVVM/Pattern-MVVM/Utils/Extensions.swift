//
//  Extensions.swift
//  Pattern-MVVM
//
//  Created by Guilherme Rangel on 24/10/20.
//


import Foundation
import UIKit

// MARK: - NSObject

extension NSObject {
    static var name: String {
        return String(describing: self)
    }
}

// MARK: - Encodable

extension Encodable {
    func toDictionary() throws -> [String: Any] {
        let data = try JSONEncoder().encode(self.self)
        let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
        return json as? [String: Any] ?? [:]
    }
}

// MARK: - Decodable

extension Decodable {
    static func fromDictionary(_ object: Any) -> Self? {
        do {
            let data = try JSONSerialization.data(withJSONObject: object, options: .prettyPrinted)
            return try JSONDecoder().decode(self.self, from: data)
        } catch {
            print(error)
        }
        return nil
    }
}

// MARK: - UIColor

extension UIColor {
    convenience init?(fromHexCode hex: String) {
        var cString: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if cString.hasPrefix("#") {
            cString.remove(at: cString.startIndex)
        }
        
        if cString.count != 6 {
            return nil
        } else {
            var rgbValue: UInt64 = 0
            Scanner(string: cString).scanHexInt64(&rgbValue)
            self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                      green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                      blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                      alpha: 1)
        }
    }
}

// MARK: - String

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
    func onlyDigits() -> String {
        let filtredUnicodeScalars = unicodeScalars.filter { CharacterSet.decimalDigits.contains($0) }
        return String(String.UnicodeScalarView(filtredUnicodeScalars))
    }
}

extension UIView {
    func setRadiusWithShadow(_ radius: CGFloat? = nil, shadow: CGFloat? = nil, shadowOp: Float? = nil) {
        layer.cornerRadius = radius ?? 4
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.shadowOffset = CGSize(width: 1.5, height: 1.5)
        layer.shadowRadius = shadow ?? 1.0
        layer.shadowOpacity = shadowOp ?? 0.7
        layer.masksToBounds = false
    }
}
