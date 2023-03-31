//
//  DummyVC.swift
//  Banksy
//
//  Created by Dmitry on 31.03.2023.
//


import UIKit



class DummyViewController: UIViewController {
    
    weak var delegate: OnboardingVCDelegate?
    weak var logoutDelegate: logoutViewControllerDelegate?
    
    let stackView = UIStackView()
    let label = UILabel()
    let logoutButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
    }
    
    private func style() {
        view.backgroundColor = .white
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 30
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Welcome"
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        
        
        
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        logoutButton.configuration = .filled()
        logoutButton.setTitle("LogOut", for: [])
        logoutButton.addTarget(self, action: #selector(logOut), for: .primaryActionTriggered)
        
    }
    
    private func layout() {
        
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(logoutButton)
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        
        ])
    }
    
    
    @objc func logOut(_ sender: UIButton) {
        logoutDelegate?.didLogout()
    }
}



    
    


