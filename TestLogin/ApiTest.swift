//
//  ApiTest.swift
//  TestLogin
//
//  Created by Vandana Mishra on 7/27/22.
//

import XCTest
@testable import Tesla_POC

class ApiTest: XCTestCase {
    //var api : InsuranceDetailViewController?
    
    override func setUpWithError() throws {
        continueAfterFailure = false
       // api = InsuranceDetailViewController()
       // XCUIApplication().launch()
    }

    override func tearDownWithError() throws {
       //  api = nil
    }

    func testExample() throws {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testAPiCheck(){
        var api = InsuranceDetailViewController()
      
        api.getInsuranceDetail { status in
            XCTAssert(true)
        }
        
      //  XCTAssertTrue(true)
    }
}
