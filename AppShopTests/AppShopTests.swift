//
//  AppShopTests.swift
//  AppShopTests
//
//  Created by Pavel Khlebnikov on 21.07.2021.
//

import XCTest
import Alamofire
@testable import AppShop

class AppShopTests: XCTestCase {
    
    //need to keep a reference to Session until your requests are complete,
    //otherwise it will be deinitialized and cancel your requests.
    let requestFactory = RequestFactory()
    
    private func makeAuthFactory() -> AuthRequestFactory {
        requestFactory.makeAuthRequestFatory()
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testLoginSuccess() {
        //Given
        let userName = "Somebody"
        let userPassword = "mypassword"
        
        //When
        let logginIn = expectation(description: "Login in")
        
        makeAuthFactory().login(userName: userName, password: userPassword) { response in
            switch response.result {
            case .success(let login):
                XCTAssertEqual(login.user.id, 123)
                logginIn.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        waitForExpectations(timeout: 3)
    }

    func testLogout() {
        //Given
        let userId = "123"
        
        //When
        let logout = expectation(description: "Logout")
        
        makeAuthFactory().logout(userId: userId) { response in
            switch response.result {
            case .success(let login):
                XCTAssertEqual(login.result, 1)
                logout.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        waitForExpectations(timeout: 3)
    }
    
//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

}
