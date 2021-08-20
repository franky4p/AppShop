//
//  ListProducts.swift
//  AppShop
//
//  Created by Pavel Khlebnikov on 03.08.2021.
//

import Foundation

struct ListProductsResult: Codable {
    enum CodingKeys: String, CodingKey {
        case pageNumber = "page_number"
        case result = "result"
        case products = "products"
        case message = "user_message"
    }
    let result: Int
    let pageNumber: Int
    let products: [Product]
    let message: String
}

struct Product: Codable {
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case price = "price"
        case productDescription = "description"
    }
    
    let id: Int
    let name: String
    let price: Double
    let productDescription: String
}
