//
//  ViewController.swift
//  Banksy
//
//  Created by Dmitry on 28.03.2023.
//

import UIKit

class LoginVC: UIViewController {
    
    let mainLabel = UILabel()
    let loginView = LoginView()
    let signInButton = UIButton(type: .system)
    let errorMessageLabel = UILabel()
    
    
    var username: String? {
        return loginView.userNameTextField.text
    }
    
    var password: String? {
        return loginView.passTextField.text
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
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
        
        NSLayoutConstraint.activate([
            
            //mainLabel
         //   mainLabel.bottomAnchor.constraint(equalTo: loginView.topAnchor, multiplier: 1),
            
            mainLabel.bottomAnchor.constraint(equalTo: loginView.topAnchor, constant: -160),
            mainLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            mainLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
            
            
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
        } else {
            configureView(withMessage: "wrong userName or password")
        }
    }
    
    private func configureView(withMessage message: String) {
        errorMessageLabel.isHidden = false
        errorMessageLabel.text = message
        
    }
}
