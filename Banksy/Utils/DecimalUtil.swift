//
//  DecimalUtil.swift
//  Banksy
//
//  Created by cdv on 06.04.2023.
//

import Foundation

extension Decimal {
    var doubleValue: Double {
        return NSDecimalNumber(decimal: self).doubleValue
    }
}
