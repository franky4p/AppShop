//
//  LoginResult.swift
//  AppShop
//
//  Created by Pavel Khlebnikov on 26.07.2021.
//

import Foundation

struct LoginResult: Codable {
    enum CodingKeys: String, CodingKey {
        case result = "result"
        case user = "user"
    }
    let result: Int
    let user: User
}
