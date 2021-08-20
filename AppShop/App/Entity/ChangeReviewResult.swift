//
//  ChangeReviewResult.swift
//  AppShop
//
//  Created by Pavel Khlebnikov on 20.08.2021.
//

import Foundation

struct ChangeReviewResult: Codable {
    enum CodingKeys: String, CodingKey {
        case result = "result"
        case userMessage = "user_message"
    }
    let result: Int
    let userMessage: String
}
