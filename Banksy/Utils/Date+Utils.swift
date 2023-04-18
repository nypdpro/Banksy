//
//  Date+Utils.swift
//  Banksy
//
//  Created by cdv on 17.04.2023.
//

import UIKit

extension Date {
    
    
    static var bankeDateFormatter: DateFormatter {
        
        let formatter = DateFormatter()
        formatter.timeZone = .current
        return formatter
    }
    
    var monthDayYearString: String {
        let dateFormatter = Date.bankeDateFormatter
        dateFormatter.dateFormat = "dd MM yyyy"
        return dateFormatter.string(from: self)
        
        
    }
    
}
