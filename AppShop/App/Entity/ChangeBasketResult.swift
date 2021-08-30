//
//  ChangeBasketResult.swift
//  AppShop
//
//  Created by Pavel Khlebnikov on 30.08.2021.
//

import Foundation

struct ChangeBasketResult: Codable {
    enum CodingKeys: String, CodingKey {
        case result = "result"
        case userMessage = "user_message"
    }
    let result: Int
    let userMessage: String
}
