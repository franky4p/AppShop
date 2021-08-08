//
//  GetProductTest.swift
//  AppShopTests
//
//  Created by Pavel Khlebnikov on 04.08.2021.
//

import XCTest
@testable import AppShop

class GetProductTest: XCTestCase {

    //need to keep a reference to Session until your requests are complete,
    //otherwise it will be deinitialized and cancel your requests.
    let requestFactory = RequestFactory()
    
    private func makeProductFactory() -> ProductRequestFactory {
        requestFactory.makeProductRequestFactory()
    }

    func testGetProductSuccess() {
        //Given
        let idProduct = 1
       
        //When
        let product = expectation(description: "product")
        
        makeProductFactory().getProduct(idProduct: idProduct) { response in
            switch response.result {
            case .success(let login):
                XCTAssertEqual(login.result, 1)
                product.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        waitForExpectations(timeout: 3)
    }

}
