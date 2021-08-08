//
//  ResponseCodableTests.swift
//  AppShopTests
//
//  Created by Pavel Khlebnikov on 03.08.2021.
//

import XCTest
import Alamofire
@testable import AppShop

class ResponseCodableTests: XCTestCase {

    //need to keep a reference to Session until your requests are complete,
    //otherwise it will be deinitialized and cancel your requests.
    let requestFactory = RequestFactory()
    
    let expectation = XCTestExpectation(description: "Download https://jsonplaceholder.typicode.com/posts/1")
    var errorParser: ErrorParserStub!

    override func setUpWithError() throws {
        errorParser = ErrorParserStub()
    }

    override func tearDownWithError() throws {
        errorParser = nil
    }

    func testShouldDownloadAndParse() {
        //Given
        let host = "https://jsonplaceholder.typicode.com/posts/1"
        //When
        let complite = expectation(description: "DownloadAndParse")
        
        requestFactory.commonSession.request(host)
            .responseCodable(errorParser: errorParser) { (response: DataResponse<PostStub, AFError>) in
                switch response.result {
                case .success(_):
                    complite.fulfill()
                case .failure(let error):
                    XCTFail(error.localizedDescription)
                }
            }
        waitForExpectations(timeout: 3)
    }


}

struct PostStub: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

enum ApiErrorStub: Error {
    case fatalError
}

struct ErrorParserStub: AbstractErrorParser {
    func parse(_ result: Error) -> Error {
        return ApiErrorStub.fatalError
    }
    
    func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error? {
        return error
    }
}
