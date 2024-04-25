//
//  SceneDelegate.swift
//  CodingAssesment
//
//  Created by Macbook air on 25/04/2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        configureWindowScene(windowScene)
    }
    
    func configureWindowScene(_ windowScene: UIWindowScene) {
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = CardsController()
        window?.makeKeyAndVisible()
    }
}

