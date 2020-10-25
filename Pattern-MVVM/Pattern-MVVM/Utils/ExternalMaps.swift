//
//  ExternalMaps.swift
//  Pattern-MVVM
//
//  Created by Guilherme Rangel on 25/10/20.
//

import Foundation
import UIKit

struct ExternalMaps {
    func appleMaps(latOrigin: Double, lngOrigin: Double, latDest: Double, lngDest: Double) {
        if let url = URL(string: "http://maps.apple.com/?saddr=\(latOrigin),\(lngOrigin)&daddr=\(latDest),\(lngDest)") {
            UIApplication.shared.open(url)
        }
    }

    func wazeMaps(latOrigin _: Double, lngOrigin _: Double, latDest: Double, lngDest: Double) {
        if let url = URL(string: "https://waze.com/ul?ll=\(latDest),\(lngDest)&navigate=yes") {
            UIApplication.shared.open(url)
        }
    }

    func googleMaps(latOrigin: Double, lngOrigin: Double, latDest: Double, lngDest: Double) {
        if let url = URL(string: "comgooglemaps://?saddr=\(latOrigin),\(lngOrigin)&daddr=\(latDest),\(lngDest)&directionsmode=driving") {
            UIApplication.shared.open(url)
        }
    }
}
