//
//  ConvertCurrencyUnitTest.swift
//  CurrencyConverterTests
//
//  Created by Rohit More on 02/02/25.
//

import XCTest
@testable import CurrencyConverter

final class ConvertCurrencyUnitTest: XCTestCase {
    var apiManager = CurrencyConversionAPIManager()
    var mockConvertCurrency: MockConvertCurrencyAPIManager?
    var viewController = MainPageViewController()
    var viewModel = CurrencyConversionViewModel()
    
    
    override func setUp() {
        super.setUp()
        mockConvertCurrency = MockConvertCurrencyAPIManager()
    }
    override func tearDown() {
        mockConvertCurrency = nil
        super.tearDown()
    }
    /*
    func testBlankTargetCurrencyValidation() {
        let request = CorrencyConversionValidation.init(fromField: "", toField: "INR", amountField: 100)
        XCTAssertFalse((request.fromFieldValidation() != nil), "Please select target currency to convert.")
    }
    
    func testBlankDestinationCurrencyValidation(){
        let request = CorrencyConversionValidation.init(fromField: "USD", toField: "", amountField: 100)
        XCTAssertFalse((request.fromFieldValidation() != nil), "Please select destination currency.")
    }
    
    func testValidAmountValidation() {
        let request = CorrencyConversionValidation.init(fromField: "USD", toField: "INR", amountField: 0)
        XCTAssertFalse((request.fromFieldValidation() != nil), "Please enter valid amount to convert.")
    }
    */
    
    // MARK: This testcase is for Convert Currency api with valid parameters
    func test_convert_currency_api_with_valid_creadentials_function() async {
        let expectation = expectation(description: "convert_currency_api_with_valid_creadentials_function")
        await mockConvertCurrency?.convertCurrency(from: "USD", to: "INR", amount: 1000, completionHandler: { flag in
            XCTAssertTrue(flag)
        })
        if mockConvertCurrency?.convertCurrencyFlag == true {
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 30)
    }
    
    // MARK: This testcase is for Convert Currency api with Invalid parameters
    func test_invite_family_members_api_with_invalid_creadentials_function() async {
        let expectation = expectation(description: "invite_family_members_api_with_valid_creadentials")
        await mockConvertCurrency?.convertCurrency(from: "", to: "", amount: 0, completionHandler: { flag in
            XCTAssertTrue(flag)
        })
        if mockConvertCurrency?.convertCurrencyFlag == true {
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 30)
    }
}
