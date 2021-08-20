//
//  ChangeReviewRequestFactory.swift
//  AppShop
//
//  Created by Pavel Khlebnikov on 20.08.2021.
//

import Alamofire

protocol ChageReviewRequestFactory {
    func addReview(userId: Int?, textReview: String, completionHandler: @escaping (AFDataResponse<ChangeReviewResult>) -> Void)
    func delReview(idReview: Int, completionHandler: @escaping (AFDataResponse<ChangeReviewResult>) -> Void)
}
