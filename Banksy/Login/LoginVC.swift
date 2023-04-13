//
//  ViewController.swift
//  Banksy
//
//  Created by Dmitry on 28.03.2023.
//

import UIKit

protocol loginViewControllerDelegate: AnyObject {
    func didLogin()
}

protocol logoutViewControllerDelegate: AnyObject {
    func didLogout()
}


class LoginVC: UIViewController {
    
    weak var delegate: loginViewControllerDelegate?
    
    let mainLabel = UILabel()
    let subLabel = UILabel()
    let loginView = LoginView()
    let signInButton = UIButton(type: .system)
    let errorMessageLabel = UILabel()
    
    
    var username: String? {
        return loginView.userNameTextField.text
    }
    
    var password: String? {
        return loginView.passTextField.text
    }
    
    var trailingOffScreen: CGFloat = 1000
    var leadingOffScreen: CGFloat = -1000
    var leadingOnScreen: CGFloat = 16
    
    var titleLeadingAnchor: NSLayoutConstraint?
    var subTitleTrainlingAnchor: NSLayoutConstraint?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animate()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        signInButton.configuration?.showsActivityIndicator = false 
    }
    
    
}


extension LoginVC {
    
    private func style() {
        loginView.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBackground
        
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        mainLabel.textAlignment = .center
        mainLabel.textColor = .systemGray
        mainLabel.numberOfLines = 0
        mainLabel.text = "Welcome to Banksy"
        mainLabel.font = mainLabel.font.withSize(29)
        mainLabel.alpha = 0
        
        subLabel.translatesAutoresizingMaskIntoConstraints = false
        subLabel.textAlignment = .center
        subLabel.textColor = .systemGray
        subLabel.numberOfLines = 0
        subLabel.text = "One step ahead"
        subLabel.font = mainLabel.font.withSize(25)
        subLabel.alpha = 0
        
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.configuration = .filled()
        signInButton.configuration?.imagePadding = 8
        signInButton.setTitle("Sign In", for: [])
        signInButton.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)
        
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.textColor = .systemRed
        errorMessageLabel.numberOfLines = 0
        errorMessageLabel.isHidden = true
        
        
        
    }
    
    private func layout() {
        view.addSubview(loginView)
        view.addSubview(signInButton)
        view.addSubview(errorMessageLabel)
        view.addSubview(mainLabel)
        view.addSubview(subLabel)
        
        NSLayoutConstraint.activate([
            
            //mainLabel
         //   mainLabel.bottomAnchor.constraint(equalTo: loginView.topAnchor, multiplier: 1),
            
            mainLabel.bottomAnchor.constraint(equalTo: loginView.topAnchor, constant: -160),
            mainLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            mainLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
            
            //sublabel
            
            subLabel.bottomAnchor.constraint(equalTo: loginView.topAnchor, constant: -120),
            subLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            subLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
            
            
            
            // loginView constrains
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1),
            
            // signInButton constrains
            signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 3),
            signInButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            signInButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
            
            // error Label
            
            errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 2),
            errorMessageLabel.leadingAnchor.constraint(equalTo: signInButton.leadingAnchor),
            errorMessageLabel.trailingAnchor.constraint(equalTo: signInButton.trailingAnchor)
        ])
        
        titleLeadingAnchor = mainLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingOffScreen)
        titleLeadingAnchor?.isActive = true
        
        subTitleTrainlingAnchor = subLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: trailingOffScreen)
        subTitleTrainlingAnchor?.isActive = true
        
    }
    
    @objc func signInTapped(sender: UIButton) {
        
        errorMessageLabel.isHidden = true
        login()
    }
    
    
    private func login() {
        guard let username = username, let password = password else {
            assertionFailure("Username / password should never be nil")
            return   }
        
        if username.isEmpty || password.isEmpty {
            configureView(withMessage: "Username or password cannot be blank")
            return
        }
        
        if username == "Kevin" && password == "1234" {
            signInButton.configuration?.showsActivityIndicator = true
            delegate?.didLogin()
        } else {
            configureView(withMessage: "wrong userName or password")
        }
    }
    
    private func configureView(withMessage message: String) {
        errorMessageLabel.isHidden = false
        errorMessageLabel.text = message
        shakeButton()
        
    }
    
    private func shakeButton() {
        let animation = CAKeyframeAnimation()
        animation.keyPath = "position.x"
        animation.values = [0, 10, -10, 10, 0]
        animation.keyTimes = [0, 0.16, 0.5, 0.83, 1]
        animation.duration = 0.4
        
        animation.isAdditive = true
        signInButton.layer.add(animation, forKey: "shake")
    }
    
    private func animate() {
        
        let duration = 1.0
        let animator1 = UIViewPropertyAnimator(duration: duration, curve: .easeInOut) {
            self.titleLeadingAnchor?.constant = self.leadingOnScreen
            self.view.layoutIfNeeded()
        }
        animator1.startAnimation()
        
        let animator2 = UIViewPropertyAnimator(duration: duration, curve: .easeInOut) {
            self.subTitleTrainlingAnchor?.constant = self.leadingOnScreen
            self.view.layoutIfNeeded()
        }
        
        animator2.startAnimation(afterDelay: 1)
        
        let animator3 = UIViewPropertyAnimator(duration: duration * 3, curve: .easeInOut) {
            self.mainLabel.alpha = 1
            self.subLabel.alpha = 1 
            self.view.layoutIfNeeded()
        }
        animator3.startAnimation()
    }
        
   
}
