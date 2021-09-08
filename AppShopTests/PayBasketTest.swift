//
//  PayBasketTest.swift
//  AppShopTests
//
//  Created by Pavel Khlebnikov on 30.08.2021.
//

import XCTest
@testable import AppShop

class PayBasketTest: XCTestCase {

    //need to keep a reference to Session until your requests are complete,
    //otherwise it will be deinitialized and cancel your requests.
    let requestFactory = RequestFactory()
    
    private func makeFactory() -> PayBasketRequestFactory {
        requestFactory.makePayBasketRequestFactory()
    }

    func testPayBusketSuccess() {
        //Given
        let userId = 123
       
        //When
        let payBasket = expectation(description: "pay basket")
        
        makeFactory().payBasket(userId: userId) { response in
            switch response.result {
            case .success(let answer):
                XCTAssertEqual(answer.result, 1)
                payBasket.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        waitForExpectations(timeout: 3)
    }

}
