//
//  ListReview.swift
//  AppShop
//
//  Created by Pavel Khlebnikov on 20.08.2021.
//
import Foundation
import Alamofire

class ListReview: AbstractRequestFactory {
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

extension ListReview: ListReviewRequestFactory {
    func getListReviews(pageNumber: Int, idProduct: Int, completionHandler: @escaping (AFDataResponse<ListReviewResult>) -> Void) {
        let requestModel = ListReviewRequest(baseUrl: baseUrl, pageNumber: pageNumber, idProduct: idProduct)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension ListReview {
    struct ListReviewRequest: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "getListReview"
        
        let pageNumber: Int
        let idProduct: Int
        var parameters: Parameters? {
            ["page_number": pageNumber,
             "id_product": idProduct]
        }
    }
}
