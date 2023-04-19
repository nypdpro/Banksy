//
//  CurrencyFormatterTests.swift
//  BanksyTests
//
//  Created by cdv on 07.04.2023.
//

import UIKit

@testable import Banksy
import XCTest

class Test: XCTestCase {
    
    var formatter: CurrencyFormatter!
    
    override func setUp() {
        super.setUp()
        formatter = CurrencyFormatter()
    }
    
    func testBreakDollarsIntoCents() throws {
        let result = formatter.breakIntoDollarsAndCents(929466.23)
        XCTAssertEqual(result.0, "929,466")
        XCTAssertEqual(result.1, "23")
    }
    
    func testDollarsFormatted() throws {
        
        let result = formatter.dollarsFormatted(929466.23)
        XCTAssert(result.starts(with: "$"))
    }
    
    func testZeroDollarsFormatted() throws {
        let result = formatter.dollarsFormatted(0)
        XCTAssertEqual(result, "$0.00")
        
    }
    
    
}
