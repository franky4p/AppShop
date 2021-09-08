//
//  RegistrationRequestFactory.swift
//  AppShop
//
//  Created by Pavel Khlebnikov on 26.07.2021.
//

import Alamofire

protocol RegistrationRequestFactory {
    func register(userName: String, password: String, completionHandler: @escaping (AFDataResponse<OperationResult>) -> Void)
}
