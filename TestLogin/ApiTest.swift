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
    func testAPiCheckForTrueStatus(){

           var api =  getProductList { status, result in

               XCTAssert(status)

           }

       }

       

       func testAPiCheckForNil(){

           var api =  getProductList { status, result in

               XCTAssertNil(true)

           }

       }

       

       func testAPiCheckForCount(){

           var api =  getProductList { status, result in

               XCTAssertNotEqual(result.count, 6)

           }

       }

       

       func testAPiCheckForNotEqual(){

           var api =  getProductList { status, result in

               XCTAssertNotEqual(result.isEmpty, true)

           }

       }

       

       func testDatGetFromApi(){

           var api =  getProductList { status, Result in

               XCTAssert(true, "get data from api")

            //   XCTAssertIdentical(Result.first?.id, 1,"values are identicals")

               XCTAssertNotEqual(Result.first?.id, 2)

           }

       }
    
}
