//
//  AccountTest.swift
//  BanksyTests
//
//  Created by cdv on 19.04.2023.
//

import Foundation
import XCTest

@testable import Banksy

class AccountTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    func testCanParse() throws {
        let json = """
         [
           {
             "id": "1",
             "type": "Banking",
             "name": "Basic Savings",
             "amount": 929466.23,
             "createdDateTime" : "2010-06-21T15:29:32Z"
           },
           {
             "id": "2",
             "type": "Banking",
             "name": "No-Fee All-In Chequing",
             "amount": 17562.44,
             "createdDateTime" : "2011-06-21T15:29:32Z"
           },
          ]
        """

        
        
        
        
        let data = json.data(using: .utf8)!
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        let result = try decoder.decode(Account.self, from: data)
        
        
        
        
        XCTAssertEqual(result.id, "1")
        XCTAssertEqual(result.type, .Banking)
        XCTAssertEqual(result.name, "Basic Savings")
        XCTAssertEqual(result.amount, 929466.23)
        
        XCTAssertEqual(result.id, "2")
        XCTAssertEqual(result.type, .Banking)
        XCTAssertEqual(result.name, "No-Fee All-In Chequing")
        XCTAssertEqual(result.amount, 17562.44)
        
    }
}
