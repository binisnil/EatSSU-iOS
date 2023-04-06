//
//  SceneDelegate.swift
//  EatSSU-iOS
//
//  Created by 최지우 on 2023/02/13.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }

        window = UIWindow(windowScene: windowScene)
        window?.windowScene = windowScene
<<<<<<< HEAD
        let navigationController = UINavigationController(rootViewController: LoginViewController())
=======
        let navigationController = UINavigationController(rootViewController: ReviewViewController())
>>>>>>> main
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()

    }
}
