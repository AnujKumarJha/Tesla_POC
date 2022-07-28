//
//  TestLogin.swift
//  TestLogin
//
//  Created by Vandana Mishra on 7/27/22.
//

import XCTest
@testable import Tesla_POC

class TestLogin: XCTestCase {
    var validation : LoginValidation!
    override func setUpWithError() throws {
        validation = LoginValidation()
    }

    override func tearDownWithError() throws {
     
        validation = nil
    }

    func testExample() throws {
    }

    
    
    func test_LoginValidation_With_EmptyStrings_Returns_ValidationFailure(){

        // ARRANGE
        let request = LoginRequest(userEmail: "", userPassword: "")

        // ACT
        let result = validation.Validate(loginRequest: request)

        // ASSERT
        XCTAssertFalse(result.success)
        XCTAssertNotNil(result.error)
       // XCTAssertEqual(result.error, "email or password cannot be empty")

    }

    func test_LoginValidation_With_EmptyEmail_Returns_ValidationFailure(){

        // ARRANGE
       // let validation = LoginValidation()
        let request = LoginRequest(userEmail: "", userPassword: "test")

        // ACT
        let result = validation.Validate(loginRequest: request)

        // ASSERT
        XCTAssertFalse(false)
        XCTAssertNotNil(result.error)
       // XCTAssertEqual(result.error, "email or password cannot be empty")

    }

    func test_LoginValidation_With_EmptyPassword_Returns_ValidationFailure(){

        // ARRANGE
      //  let validation = LoginValidation()
        let request = LoginRequest(userEmail: "test", userPassword: "")

        // ACT
        let result = validation.Validate(loginRequest: request)

        // ASSERT
        XCTAssertFalse(result.success)
        XCTAssertNotNil(result.error)
       // XCTAssertEqual(result.error, "email or password cannot be empty")

    }

   

    func test_LoginValidation_With_ValidRequest_Returns_Success(){

        // ARRANGE
        let request = LoginRequest(userEmail: "codecat15@gmail.com", userPassword: "test")

        // ACT
        let result = validation.Validate(loginRequest: request)

        // ASSERT
        XCTAssertTrue(result.success)
        XCTAssertNil(result.error)
    }

}
