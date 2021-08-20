//
//  ListReviewRequestFactory.swift
//  AppShop
//
//  Created by Pavel Khlebnikov on 20.08.2021.
//

import Alamofire

protocol ListReviewRequestFactory {
    func getListReviews(pageNumber: Int, idProduct: Int, completionHandler: @escaping (AFDataResponse<ListReviewResult>) -> Void)
}
