//
//  ListProducts.swift
//  AppShop
//
//  Created by Pavel Khlebnikov on 03.08.2021.
//

import Foundation

struct ListProductsResult: Codable {
    let pageNumber: Int
    let products: [Product]
}

struct Product: Codable {
    enum CodingKeys: String, CodingKey {
        case id = "id_product"
        case name = "product_name"
        case price = "price"
    }
    
    let id: Int
    let name: String
    let price: Double
}
