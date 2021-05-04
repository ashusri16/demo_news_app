//
//  ValidationSeviceTest.swift
//  DemoAppTests
//
//  Created by Ashutosh Srivastava on 02/05/21.
//

import XCTest
@testable import DemoApp

class ValidationSeviceTest: XCTestCase {

    var validationService: ValidationService!
    
    override func setUp() {
        super.setUp()
        validationService = ValidationService()
        
    }
    
    override func tearDown() {
        validationService = nil
        super.tearDown()
    }
    
    func test_is_valid_username() throws{
        XCTAssertNoThrow(try validationService.validateUser("user123"))
    }
    
    func test_if_username_is_nil_throw_error() throws {
        let expectedError = ValidationError.invalidValue
        var error: ValidationError?
        XCTAssertThrowsError(try validationService.validateUser(nil)){thrownError in
            error = thrownError as? ValidationError
        }
        
        XCTAssertEqual(expectedError, error)
        XCTAssertEqual(expectedError.errorDescription, error?.errorDescription)
    }
    
    func test_is_username_length_within_limits() throws {
        
        let expectedErrorForShort = ValidationError.usernameTooShort
        let expectedErrorForLong = ValidationError.usernameTooLong
        var error: ValidationError?
        let shortUsername = "us"
        let longUsername = "this is a very long username"
        XCTAssertThrowsError(try validationService.validateUser(shortUsername)){thrownError in
            error = thrownError as? ValidationError
        }
        XCTAssertEqual(expectedErrorForShort, error)
        XCTAssertEqual(expectedErrorForShort.errorDescription, error?.errorDescription)
        
        XCTAssertThrowsError(try validationService.validateUser(longUsername)){thrownError in
            error = thrownError as? ValidationError
        }
        XCTAssertEqual(expectedErrorForLong, error)
        XCTAssertEqual(expectedErrorForLong.errorDescription, error?.errorDescription)
    }
    
    func test_is_valid_password() throws{
        XCTAssertNoThrow(try validationService.validatePassword("123456"))
    }
    
    func test_if_password_is_nil_throw_error() throws {
        let expectedError = ValidationError.invalidValue
        var error: ValidationError?
        XCTAssertThrowsError(try validationService.validatePassword(nil)){thrownError in
            error = thrownError as? ValidationError
        }
        
        XCTAssertEqual(expectedError, error)
        XCTAssertEqual(expectedError.errorDescription, error?.errorDescription)
    }
    
    func test_is_password_length_within_limits() throws {
        
        let expectedErrorForShort = ValidationError.passwordTooShort
        let expectedErrorForLong = ValidationError.passwordTooLong
        var error: ValidationError?
        let shortPassword = "12"
        let longPassword = "this is a very long password"
        XCTAssertThrowsError(try validationService.validatePassword(shortPassword)){thrownError in
            error = thrownError as? ValidationError
        }
        XCTAssertEqual(expectedErrorForShort, error)
        XCTAssertEqual(expectedErrorForShort.errorDescription, error?.errorDescription)
        
        XCTAssertThrowsError(try validationService.validatePassword(longPassword)){thrownError in
            error = thrownError as? ValidationError
        }
        XCTAssertEqual(expectedErrorForLong, error)
        XCTAssertEqual(expectedErrorForLong.errorDescription, error?.errorDescription)
        
    }
    
    func test_on_wrong_credentials_return_false() throws{
        let username = "abcdef"    //wrong credentials
        let password = "098765"
        XCTAssertFalse(validationService.authenticateCredentials(username, password))
    }
    
    func test_authenticate_correct_credentials_returns_true() throws {
        let username = "user123"    //correct credentials
        let password = "123456"
        
        XCTAssertTrue(validationService.authenticateCredentials(username, password))
    }
    
    
}
