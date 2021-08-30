//
//  RequestFactory.swift
//  AppShop
//
//  Created by Pavel Khlebnikov on 26.07.2021.
//

import Foundation
import Alamofire

class RequestFactory {
    func makeErrorParser() -> AbstractErrorParser {
        return ErrorParser()
    }
    
    lazy var commonSession: Session = {
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.headers = .default
        let manager = Session(configuration: configuration)
        return manager
    }()
    
    let sessionQueue = DispatchQueue.global(qos: .utility)
    
    func makeAuthRequestFatory() -> AuthRequestFactory {
        let errorParser = makeErrorParser()
        return Auth(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeRegistrationRequestFactory() -> RegistrationRequestFactory {
        let errorParser = makeErrorParser()
        return Registration(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeChageUserDataRequestFactory() -> ChangeUserDataRequestFactory {
        let errorParser = makeErrorParser()
        return ChangeUserData(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeListProductsRequestFactory() -> ListProductsRequestFactory {
        let errorParser = makeErrorParser()
        return ListProducts(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeProductRequestFactory() -> ProductRequestFactory {
        let errorParser = makeErrorParser()
        return GetProduct(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeChangeReviewRequestFactory() -> ChageReviewRequestFactory {
        let errorParser = makeErrorParser()
        return ChageReview(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeListReviewRequestFactory() -> ListReviewRequestFactory {
        let errorParser = makeErrorParser()
        return ListReview(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeChangeBasketRequestFactory() -> ChangeBasketRequestFactory {
        let errorParser = makeErrorParser()
        return ChangeBasket(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makePayBasketRequestFactory() -> PayBasketRequestFactory {
        let errorParser = makeErrorParser()
        return PayBasket(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
}
