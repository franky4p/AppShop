//
//  PayBasket.swift
//  AppShop
//
//  Created by Pavel Khlebnikov on 30.08.2021.
//

import Foundation
import Alamofire

class PayBasket: AbstractRequestFactory {
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

extension PayBasket: PayBasketRequestFactory {
    func payBasket(userId: Int, completionHandler: @escaping (AFDataResponse<PayBasketResult>) -> Void) {
        let requestModel = PayBasketRequest(baseUrl: baseUrl, userId: userId)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension PayBasket {
    struct PayBasketRequest: RequestRouter {
        let method: HTTPMethod = .post
        let baseUrl: URL
        let path: String = "payBasket"
        
        let userId: Int
        var parameters: Parameters? {
            ["id_user": userId]
        }
    }
}
