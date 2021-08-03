//
//  ChageUserDataTest.swift
//  AppShopTests
//
//  Created by Pavel Khlebnikov on 03.08.2021.
//

import XCTest
@testable import AppShop

class ChageUserDataTest: XCTestCase {

    //need to keep a reference to Session until your requests are complete,
    //otherwise it will be deinitialized and cancel your requests.
    let requestFactory = RequestFactory()
    
    private func makeChangeUserDataFactory() -> ChangeUserDataRequestFactory {
        requestFactory.makeChageUserDataRequestFactory()
    }

    func testRegistrationSuccess() {
        //Given
        let userName = "Somebody"
        let userPassword = "mypassword"
        let email = "vasya@ya.ru"
        let gender = "m"
        
        //When
        let changeUserData = expectation(description: "ChangeUserData")
        
        makeChangeUserDataFactory().changeUserData(userName: userName, password: userPassword, email: email, gender: gender) { response in
            switch response.result {
            case .success(let login):
                XCTAssertEqual(login.result, 1)
                changeUserData.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        waitForExpectations(timeout: 3)
    }
}
