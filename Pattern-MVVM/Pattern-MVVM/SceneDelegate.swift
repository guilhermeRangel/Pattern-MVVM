//
//  SceneDelegate.swift
//  Pattern-MVVM
//
//  Created by Guilherme Rangel on 24/10/20.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    var coordinator: MainCoordinator?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        
        let nvController = UINavigationController()
        
        coordinator = MainCoordinator(navigationController: nvController)

        coordinator?.start()
        
        window = UIWindow(windowScene: scene)
        window?.rootViewController = nvController
        window?.makeKeyAndVisible()
    }
}
