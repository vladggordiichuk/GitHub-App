//
//  SceneDelegate.swift
//  GitHub App
//
//  Created by Vlad Gordiichuk on 23.06.2020.
//  Copyright © 2020 Vlad Gordiichuk. All rights reserved.
//

import UIKit


class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    @available(iOS 13.0, *)
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        if let windowScene = scene as? UIWindowScene {
            
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = SceneDelegate.rootNavigationBar
            
            self.window = window
            window.makeKeyAndVisible()
        }
    }
    
    static var rootNavigationBar: UINavigationController = {
        let navigationController = UINavigationController(rootViewController: ListViewController(collectionViewLayout: UICollectionViewFlowLayout()))
        return navigationController
    }()
}

