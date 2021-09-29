//
//  AppShopUITests.swift
//  AppShopUITests
//
//  Created by Pavel Khlebnikov on 21.07.2021.
//

import XCTest

class AppShopUITests: XCTestCase {

    override func setUpWithError() throws {
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
    }


    func testLogin() throws {
        let app = XCUIApplication()
        app.launch()
        
        let loginField = app.textFields["login"].firstMatch
        XCTAssertTrue(loginField.exists, app.debugDescription)
        
        loginField.tap()
        loginField.typeText("test")
       
        let paswrdSecureTextField = app.secureTextFields["paswrd"].firstMatch
        XCTAssertTrue(paswrdSecureTextField.exists, app.debugDescription)
        
        paswrdSecureTextField.tap()
        paswrdSecureTextField.typeText("test")
        
        app/*@START_MENU_TOKEN@*/.staticTexts["Войти"]/*[[".buttons[\"Войти\"].staticTexts[\"Войти\"]",".staticTexts[\"Войти\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let newView = app.navigationBars["Товары"].firstMatch
        XCTAssertTrue(newView.waitForExistence(timeout: 4), app.debugDescription)
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
