//
//  ListProductsTest.swift
//  AppShopTests
//
//  Created by Pavel Khlebnikov on 03.08.2021.
//

import XCTest
@testable import AppShop

class ListProductsTest: XCTestCase {

    //need to keep a reference to Session until your requests are complete,
    //otherwise it will be deinitialized and cancel your requests.
    let requestFactory = RequestFactory()
    
    private func makeListProductsFactory() -> ListProductsRequestFactory {
        requestFactory.makeListProductsRequestFactory()
    }

    func testRegistrationSuccess() {
        //Given
        let pageNumber = 1
        let idCategory = 1
       
        //When
        let products = expectation(description: "products")
        
        makeListProductsFactory().getListProducts(pageNumber: pageNumber, idCategory: idCategory) { response in
            switch response.result {
            case .success(let login):
                XCTAssertEqual(login.pageNumber, 1)
                products.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        waitForExpectations(timeout: 3)
    }

}
