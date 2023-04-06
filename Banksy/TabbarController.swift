//
//  TabbarController.swift
//  WorkoutApp
//
//  Created by cdv on 07.02.2023.
//

import UIKit


enum Tabs: Int {
    case summary
    case moveMoney
    case more
}

final class TabbarController: UITabBarController {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        configure()
        setStatusBar()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    private func configure() {
        tabBar.tintColor = Resources.Colors.active
        tabBar.tintColor = Resources.Colors.inactive
        tabBar.backgroundColor = Resources.Colors.background
        
        tabBar.layer.borderColor = Resources.Colors.separator.cgColor
        tabBar.layer.borderWidth = 2
        tabBar.layer.masksToBounds = true
        
        let summaryVC = AccountSummaryViewController()
        let moveMoneyVC = MoveMoneyViewController()
        let moreVC = MoreViewController()
        
        
        
        let summaryNavigation = NavBarController(rootViewController: summaryVC)
        let moveMoneyNavigation = NavBarController(rootViewController: moveMoneyVC)
        let moreNavigation = NavBarController(rootViewController: moreVC)
        
        
        summaryVC.tabBarItem = UITabBarItem(title: Resources.String.TabBar.summary, image: Resources.Images.TabBar.summary, tag: Tabs.summary.rawValue)
        moveMoneyVC.tabBarItem = UITabBarItem(title: Resources.String.TabBar.moveMoney, image: Resources.Images.TabBar.moveMoney, tag:
                                                Tabs.moveMoney.rawValue)
        moreVC.tabBarItem = UITabBarItem(title: Resources.String.TabBar.more, image: Resources.Images.TabBar.more, tag: Tabs.more.rawValue)
        
        
        
        setViewControllers([summaryNavigation,moveMoneyNavigation,moreNavigation], animated: true)
        summaryNavigation.navigationBar.barTintColor = appColor
        hideNavigationBarLine(summaryNavigation.navigationBar)
        
        
    }
    
    private func hideNavigationBarLine(_ navigationBar: UINavigationBar) {
        let img = UIImage()
        navigationBar.shadowImage = img
        navigationBar.setBackgroundImage(img, for: .default)
        navigationBar.isTranslucent = false
    }
    
    
}
