//
//  SceneDelegate.swift
//  MyAppSaveliyRadchyck
//
//  Created by Saveliy Radchyck on 1/22/20.
//  Copyright © 2020 Saveliy Radchyck. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    @available(iOS 13.0, *)
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let livePhotosVC = LivePhotosViewController()
        window?.rootViewController = livePhotosVC
        window?.makeKeyAndVisible()
    }
}

