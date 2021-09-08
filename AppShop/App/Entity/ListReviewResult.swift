//
//  ListReviewResult.swift
//  AppShop
//
//  Created by Pavel Khlebnikov on 20.08.2021.
//

import Foundation

struct ListReviewResult: Codable {
    enum CodingKeys: String, CodingKey {
        case pageNumber = "page_number"
        case result = "result"
        case reviews = "reviews"
        case message = "user_message"
    }
    let result: Int
    let pageNumber: Int
    let reviews: [Review]
    let message: String
}

struct Review: Codable {
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case textReview = "text"
    }
    
    let id: Int
    let textReview: String
}
