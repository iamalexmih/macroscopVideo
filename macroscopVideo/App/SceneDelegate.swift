//
//  SceneDelegate.swift
//  macroscopVideo
//
//  Created by Алексей Попроцкий on 24.05.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
//        let network = NetworkService()
//        let viewModel = ViewModel(networkService: network)
        let viewController = ViewController()
//        viewController.viewModel = viewModel
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
    }
}

