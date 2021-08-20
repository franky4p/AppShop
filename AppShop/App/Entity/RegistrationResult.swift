//
//  RegistrationResult.swift
//  AppShop
//
//  Created by Pavel Khlebnikov on 26.07.2021.
//

import Foundation

struct RegistrationResult: Codable {
    enum CodingKeys: String, CodingKey {
        case result = "result"
        case userMessage = "user_message"
    }
    let result: Int
    let userMessage: String
}
