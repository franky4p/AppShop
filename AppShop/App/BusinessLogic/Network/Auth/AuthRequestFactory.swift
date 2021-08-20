//
//  AuthRequestFactory.swift
//  AppShop
//
//  Created by Pavel Khlebnikov on 26.07.2021.
//

import Alamofire

protocol AuthRequestFactory {
    func login(userName: String, password: String, completionHandler: @escaping (AFDataResponse<LoginResult>) -> Void)
    func logout(userId: String, completionHandler: @escaping (AFDataResponse<LogoutResult>) -> Void)
}

