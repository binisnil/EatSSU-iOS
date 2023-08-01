//
//  SceneDelegate.swift
//  EatSSU-iOS
//
//  Created by 최지우 on 2023/02/13.
//

import UIKit
import SwiftUI

import KakaoSDKAuth

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        if let url = URLContexts.first?.url {
            if (AuthApi.isKakaoTalkLoginUrl(url)) {
                _ = AuthController.handleOpenUrl(url: url)
            }
        }
    }
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        window?.windowScene = windowScene
        let navigationController = UINavigationController(rootViewController: SetNickNameViewController())
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
    }
}
