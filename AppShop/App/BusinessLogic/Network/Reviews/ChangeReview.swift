//
//  ChangeReview.swift
//  AppShop
//
//  Created by Pavel Khlebnikov on 20.08.2021.
//
import Foundation
import Alamofire

class ChageReview: AbstractRequestFactory {
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

extension ChageReview: ChageReviewRequestFactory {
    func addReview(userId: Int?, textReview: String, completionHandler: @escaping (AFDataResponse<ChangeReviewResult>) -> Void) {
        let requestModel = AddRewiew(baseUrl: baseUrl, userId: userId, textReview: textReview)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func delReview(idReview: Int, completionHandler: @escaping (AFDataResponse<ChangeReviewResult>) -> Void) {
        let requestModel = DelRewiew(baseUrl: baseUrl, idReview: idReview)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension ChageReview {
    struct AddRewiew: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "addReview"
        
        let userId: Int?
        let textReview: String
        var parameters: Parameters? {
            ["id_user": userId ?? 0,
             "text": textReview]
        }
    }
    struct DelRewiew: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "delReview"
        
        let idReview: Int
        var parameters: Parameters? {
            ["id_comment": idReview ]
        }
    }
}

