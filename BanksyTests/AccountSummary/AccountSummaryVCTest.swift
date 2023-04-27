//
//  AccountSummaryVCTest.swift
//  BanksyTests
//
//  Created by cdv on 26.04.2023.
//

import UIKit
import XCTest

@testable import Banksy

class AccountSummaryViewControllerTests: XCTestCase {
    var vc: AccountSummaryViewController!
    var mockManager: MockProfileManager!
    
    class MockProfileManager: ProfileManageable {
            var profile: Profile?
            var error: NetworkError?
            
            func fetchProfile(forUserId userId: String, completion: @escaping (Result<Profile, NetworkError>) -> Void) {
                if error != nil {
                    completion(.failure(error!))
                    return
                }
                profile = Profile(id: "1", firstName: "FirstName", lastName: "LastName")
                completion(.success(profile!))
            }
        }
    
    
    
    override func setUp() {
        super.setUp()
        vc = AccountSummaryViewController()
        // vc.loadViewIfNeeded()
    }
    
    func testTitleAndMessageForServerError() throws {
        
        let titleAndMessageServerError = vc.titleAndMessageForTesting(for: .serverError)
        XCTAssertEqual("Server Error", titleAndMessageServerError.0)
        XCTAssertEqual("Ensure you are connected to the internet. Please try again.", titleAndMessageServerError.1)
      
        
    }
    
    func testTitleAndMessageForDecodingError() throws {
        
        let titleAndMessageDecodingError = vc.titleAndMessageForTesting(for: .decodingError)
        XCTAssertEqual("Decoding Error", titleAndMessageDecodingError.0)
        XCTAssertEqual("We could not process your request. Please try again.", titleAndMessageDecodingError.1)
        
    }
    
}
