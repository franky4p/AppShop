//
//  AddToBasket.swift
//  AppShop
//
//  Created by Pavel Khlebnikov on 30.08.2021.
//

import Foundation
import Alamofire

class ChangeBasket: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl = Settings.baseUrl
    
    init(errorParser: AbstractErrorParser, sessionManager: Session, queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
}

extension ChangeBasket: ChangeBasketRequestFactory {
    func addToBasket(productId: Int, amount: Int, completionHandler: @escaping (AFDataResponse<OperationResult>) -> Void) {
        let requestModel = ChangeBasketRequest(baseUrl: baseUrl, path: "addToBasket", productId: productId, amount: amount)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func delFromBasket(productId: Int, amount: Int, completionHandler: @escaping (AFDataResponse<OperationResult>) -> Void) {
        let requestModel = ChangeBasketRequest(baseUrl: baseUrl, path: "delFromBasket", productId: productId, amount: amount)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension ChangeBasket {
    struct ChangeBasketRequest: RequestRouter {
        let method: HTTPMethod = .post
        let baseUrl: URL
        let path: String
        
        let productId: Int
        let amount: Int
        var parameters: Parameters? {
            ["id_product": productId,
             "amount": amount]
        }
    }
}

