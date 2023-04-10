//
//  Resources.swift
//  Banksy
//
//  Created by Dmitry on 03.04.2023.
//

import UIKit



enum Resources {
    enum Colors {
        static let active = UIColor(hexString: "#AF52DE")
        static let inactive = UIColor(hexString: "#929DA5")

        static let background = UIColor(hexString: "#F8F9F9")
        static let separator = UIColor(hexString: "#E8ECEF")
        static let secondary = UIColor(hexString: "#F0F3FF")

        static let titleGray = UIColor(hexString: "#545C77")
        static let subtitleGray = UIColor(hexString: "#D8D8D8")
    }
    
    enum String {
        
        enum TabBar {
            static var summary = "Summary"
            static var moveMoney = "Move Money"
            static var more = "More"
          
        }
    }
    
    enum Images {
        enum TabBar {
        static var summary = UIImage(systemName: "list.dash.header.rectangle")
        static var moveMoney  = UIImage(systemName: "arrow.left.arrow.right")
        static var more = UIImage(systemName: "ellipsis.circle")
    
        }
    }
    
    
    enum Fonts {
        static func helvelticaRegular(with size: CGFloat) -> UIFont {
            UIFont(name: "Helvetica", size: size) ?? UIFont()
        }
    }
    
    
    
}
