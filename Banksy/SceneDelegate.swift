//
//  SceneDelegate.swift
//  Banksy
//
//  Created by Dmitry on 28.03.2023.
//

import UIKit

let appColor: UIColor = .systemTeal

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    let loginVC = LoginVC()
    let onBVC =  OnboardingContainerViewController()
    let dummyVC = DummyViewController()
    let mainVC = TabbarController()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        loginVC.delegate = self
        onBVC.delegate = self
        dummyVC.delegate = self
        dummyVC.logoutDelegate = self
        
        registerForNotification()
 
        window?.rootViewController = mainVC
        window?.makeKeyAndVisible()
        
    }


}

extension SceneDelegate {
    func registerForNotification() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(didLogout), name: .logout, object: nil)
    }
    
    
}

extension SceneDelegate: loginViewControllerDelegate {
    func didLogin() {
        
        if LocalState.hasOnboarded {
            setRootViewController(mainVC)
        } else {
            setRootViewController(onBVC)
        }
        
    }
}
    

extension SceneDelegate: OnboardingVCDelegate {
    func didFinishOnboarding() {
        LocalState.hasOnboarded = true
        setRootViewController(mainVC)
    }
}

extension SceneDelegate: logoutViewControllerDelegate {
    @objc func didLogout() {
        setRootViewController(loginVC)
    }
}


    
extension SceneDelegate {
    //func to set smooth transsition
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
