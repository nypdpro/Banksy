//
//  NavBarController.swift
//  Banksy
//
//  Created by Dmitry on 03.04.2023.
//

import UIKit


 class NavBarController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        
    }
    
    private func configure() {
        
        view.backgroundColor = .white
        navigationBar.isTranslucent = false
        navigationBar.standardAppearance.titleTextAttributes = [
            .foregroundColor: Resources.Colors.titleGray,
            .font: Resources.Fonts.helvelticaRegular(with: 17) ]
          
       // navigationBar.addButtonBorder(with: Resources.Colors.separator, width: 2)
        
        
    }
}
