//
//  RegistrationTest.swift
//  AppShopTests
//
//  Created by Pavel Khlebnikov on 03.08.2021.
//

import XCTest
@testable import AppShop

class RegistrationTest: XCTestCase {

    //need to keep a reference to Session until your requests are complete,
    //otherwise it will be deinitialized and cancel your requests.
    let requestFactory = RequestFactory()
    
    private func makeRegistrationFactory() -> RegistrationRequestFactory {
        requestFactory.makeRegistrationRequestFactory()
    }

    func testRegistrationSuccess() {
        //Given
        let userName = "Somebody"
        let userPassword = "mypassword"
        
        //When
        let registration = expectation(description: "Registration")
        
        makeRegistrationFactory().register(userName: userName, password: userPassword) { response in
            switch response.result {
            case .success(let login):
                XCTAssertEqual(login.result, 1)
                registration.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        waitForExpectations(timeout: 3)
    }

}
