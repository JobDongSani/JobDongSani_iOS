//
//  SceneDelegate.swift
//  Hackathon2021
//
//  Created by Ji-hoon Ahn on 2021/11/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        let mainViewController = LoginViewController()
        
        let navigationViewController = UINavigationController(rootViewController: mainViewController)
        navigationViewController.navigationBar.isHidden = true
        window.backgroundColor = .clear
        window.rootViewController = navigationViewController
        window.makeKeyAndVisible()
        for fontFaily in UIFont.familyNames{
            for fontName in UIFont.fontNames(forFamilyName: fontFaily){
                print(fontName)
            }
        }
    }
}

