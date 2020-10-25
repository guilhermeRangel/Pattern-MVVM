//
//  LocationService.swift
//  Pattern-MVVM
//
//  Created by Guilherme Rangel on 25/10/20.
//


import UIKit
import CoreLocation

class CoreLocationManager: NSObject {
    var locationManager: CLLocationManager?
    var status: CLAuthorizationStatus?

    override init() {
        super.init()
        locationManager = CLLocationManager()
        locationManager?.delegate = self

        locationManager?.activityType = .automotiveNavigation
        locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        configureLocationMAnager()
    }
}

extension CoreLocationManager: CLLocationManagerDelegate {
    func locationManager(_: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedAlways, .authorizedWhenInUse:
            print("Autorizado sempre ou enquanto usa")

        case .notDetermined, .denied, .restricted:
            print("Qualquer outro")
        @unknown default:
            print("default")
        }
    }

    func configureLocationMAnager() {
        status = CLLocationManager.authorizationStatus()
        if status == .notDetermined || status == .denied {
            locationManager?.requestWhenInUseAuthorization()
        }

        if status == .authorizedWhenInUse || status == .authorizedAlways {
            print("ja foi autorizado")
        }
    }
}

