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
        let network = NetworkService()
        let viewModel = ListCamerasViewModel(networkService: network)
        let viewController = ListCamerasViewController()
        let navController = UINavigationController(rootViewController: viewController)
        viewController.viewModel = viewModel
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
    }
}

