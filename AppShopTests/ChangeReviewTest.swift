//
//  ChangeReviewTest.swift
//  AppShopTests
//
//  Created by Pavel Khlebnikov on 20.08.2021.
//

import XCTest
import Alamofire
@testable import AppShop

class ChangeReviewTest: XCTestCase {

    //need to keep a reference to Session until your requests are complete,
    //otherwise it will be deinitialized and cancel your requests.
    let requestFactory = RequestFactory()
    
    private func makeFactory() -> ChageReviewRequestFactory {
        requestFactory.makeChangeReviewRequestFactory()
    }
    
    func testAddReviewSuccess() {
        //Given
        let userId = 123
        let text = "Hello world"
        
        //When
        let addReview = expectation(description: "addReview")
        
        makeFactory().addReview(userId: userId, textReview: text) { response in
            switch response.result {
            case .success(let answer):
                XCTAssertEqual(answer.result, 1)
                addReview.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        waitForExpectations(timeout: 3)
    }

    func testDelReviewSuccess() {
        //Given
        let idReview = 123
        
        //When
        let delReview = expectation(description: "delReview")
        
        makeFactory().delReview(idReview: idReview) { response in
            switch response.result {
            case .success(let answer):
                XCTAssertEqual(answer.result, 1)
                delReview.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        waitForExpectations(timeout: 3)
    }
}
