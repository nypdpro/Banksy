//
//  UIViewController+Utils.swift
//  Banksy
//
//  Created by Dmitry on 01.04.2023.
//

import UIKit

extension UIViewController {
    
    func setStatusBar() {
        
        let statusBarSize = UIApplication.shared.statusBarFrame.size
        let frame = CGRect(origin: .zero, size: statusBarSize)
        let statusbarView = UIView(frame: frame)
        
        statusbarView.backgroundColor = appColor
        view.addSubview(statusbarView)
    }
    
    
    func setTabBarImage(imageName: String, title: String) {
        let configuration = UIImage.SymbolConfiguration(scale: .large)
        let image = UIImage(systemName: title, withConfiguration: configuration)
        tabBarItem = UITabBarItem(title: title, image: image, tag: 0)
    }
    
}
