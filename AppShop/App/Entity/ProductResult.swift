//
//  ProductResult.swift
//  AppShop
//
//  Created by Pavel Khlebnikov on 04.08.2021.
//

import Foundation

struct ProductResult: Codable {
    enum CodingKeys: String, CodingKey {
        case product = "product"
        case message = "user_message"
        case result = "result"
    }
    let product: Product
    let result: Int
    let message: String
}
