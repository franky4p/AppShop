//
//  ProductResult.swift
//  AppShop
//
//  Created by Pavel Khlebnikov on 04.08.2021.
//

import Foundation

struct ProductResult: Codable {
    enum CodingKeys: String, CodingKey {
        case result = "result"
        case name = "product_name"
        case price = "product_price"
        case description = "product_description"
    }
    
    let result: Int
    let name: String
    let price: Double
    let description: String
}
