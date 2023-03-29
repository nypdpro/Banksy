//
//  OnboardingViewController.swift
//  Banksy
//
//  Created by Dmitry on 29.03.2023.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    let stackView = UIStackView()
    let label = UILabel()
    let imageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
    
    func style() {
        view.backgroundColor = .white
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 30
        
        //image
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "delorean")
        
        // Label
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        label.text = "2023-03-29 21:30:58.641544+0300 Banksy[51608:959148] [HardwareKeyboard] -[UIApplication getKeyboardDevicePropertiesForSenderID:shouldUpdate:usingSyntheticEvent:], failed to fetch device property for senderID (778835616971358211) use primary keyboard info instead"
        label.font = UIFont.preferredFont(forTextStyle: .title3)
    }
    func layout() {
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(label)
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1)
        
        ])
        
    }
}

