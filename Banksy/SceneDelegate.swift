//
//  SceneDelegate.swift
//  Banksy
//
//  Created by Dmitry on 28.03.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    let loginVC = LoginVC()
    let onBVC =  OnboardingContainerViewController()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        //window?.rootViewController = LoginVC()
        loginVC.delegate = self
        onBVC.delegate = self
 
        window?.rootViewController = OnboardingContainerViewController()
        window?.makeKeyAndVisible()
        
    }

    func sceneDidDisconnect(_ scene: UIScene) {
      
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        
    }

    func sceneWillResignActive(_ scene: UIScene) {
        
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        
    }


}

extension SceneDelegate: loginViewControllerDelegate {
    func didLogin() {
        print("did login")
    }
}
    

extension SceneDelegate: OnboardingVCDelegate {
    func didFinishOnboarding() {
        print("onboarding is done")
    }
    
    
}
    

