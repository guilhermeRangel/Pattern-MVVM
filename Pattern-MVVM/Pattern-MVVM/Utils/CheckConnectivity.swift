//
//  CheckConnectivity.swift
//  Pattern-MVVM
//
//  Created by Guilherme Rangel on 25/10/20.
//


import Alamofire
import Foundation

struct CheckConnectivity {
    static let sharedInstance = NetworkReachabilityManager()!
    static var isConnectedToInternet: Bool {
        return sharedInstance.isReachable
    }
}
