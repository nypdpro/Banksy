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
    let dummyVC = DummyViewController()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        //window?.rootViewController = LoginVC()
        loginVC.delegate = self
        onBVC.delegate = self
        dummyVC.delegate = self
        dummyVC.logoutDelegate = self
        
 
        window?.rootViewController = loginVC
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
        
        if LocalState.hasOnboarded {
            setRootViewController(dummyVC)
        } else {
            setRootViewController(onBVC)
        }
        
    }
}
    

extension SceneDelegate: OnboardingVCDelegate {
    func didFinishOnboarding() {
        LocalState.hasOnboarded = true
        setRootViewController(dummyVC)
    }
}

extension SceneDelegate: logoutViewControllerDelegate {
    func didLogout() {
        setRootViewController(loginVC)
    }
}


    
extension SceneDelegate {
    
    func setRootViewController(_ vc: UIViewController, animated: Bool = true) {
        
        guard animated, let window = self.window else {
            self.window?.rootViewController = vc
            self.window?.makeKeyAndVisible()
            return
        }
        window.rootViewController = vc
        window.makeKeyAndVisible()
        UIView.transition(with: window, duration: 0.7, options: .transitionCrossDissolve, animations: nil, completion: nil)
        
    }
}
