//
//  ListProducts.swift
//  AppShop
//
//  Created by Pavel Khlebnikov on 03.08.2021.
//

import Foundation
import Alamofire

class ListProducts: AbstractRequestFactory {
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

extension ListProducts: ListProductsRequestFactory {
    func getListProducts(pageNumber: Int, idCategory: Int, completionHandler: @escaping (AFDataResponse<ListProductsResult>) -> Void) {
        let requestModel = ListProductsRequest(baseUrl: baseUrl, pageNumber: pageNumber, idCategory: idCategory)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension ListProducts {
    struct ListProductsRequest: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "getListProducts"
        
        let pageNumber: Int
        let idCategory: Int
        var parameters: Parameters? {
            ["page_number": pageNumber,
             "id_category": idCategory]
        }
    }
}
