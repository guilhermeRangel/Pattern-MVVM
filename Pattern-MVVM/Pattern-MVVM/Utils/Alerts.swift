//
//  Alerts.swift
//  Pattern-MVVM
//
//  Created by Guilherme Rangel on 25/10/20.
//

import Foundation
import UIKit
struct Alerts {
    var externalMaps = ExternalMaps()
    
    func alertOffline() -> UIAlertController {
        let alert = UIAlertController(title: "Você esta Offline", message: "Parece que você está sem conexão no momento", preferredStyle: .alert)

        let okAction = UIAlertAction(title: "done".localized, style: .cancel, handler: nil)
        alert.addAction(okAction)
        return alert
    }
    
    func alertExternalMaps(latOrigin: Double, lngOrigin: Double, latDest: Double, lngDest: Double) -> UIAlertController {
        let actionSheetController = UIAlertController(title: "Escolha seu mapa de preferencia".localized, message: "", preferredStyle: UIAlertController.Style.actionSheet)

        actionSheetController.addAction(UIAlertAction(title: "Apple Maps".localized, style: UIAlertAction.Style.default, handler: {
            (_) -> Void in
            self.externalMaps.appleMaps(latOrigin: latOrigin, lngOrigin: lngOrigin, latDest: latDest, lngDest: lngDest)
            print("Apple Maps")
        }))

        actionSheetController.addAction(UIAlertAction(title: "Google Maps".localized, style: UIAlertAction.Style.default, handler: { (_) -> Void in
            self.externalMaps.googleMaps(latOrigin: latOrigin, lngOrigin: lngOrigin, latDest: latDest, lngDest: lngDest)
            print("google")
        }))

        // Add Discard-Action
        actionSheetController.addAction(UIAlertAction(title: "Waze Maps".localized, style: UIAlertAction.Style.default, handler: { (_) -> Void in
            self.externalMaps.wazeMaps(latOrigin: latOrigin, lngOrigin: lngOrigin, latDest: latDest, lngDest: lngDest)
            print("waze")
        }))

        actionSheetController.addAction(UIAlertAction(title: "Cacelar".localized, style: UIAlertAction.Style.cancel, handler: { (_) -> Void in

            print("dismiss")
        }))
        return actionSheetController
    }
}
