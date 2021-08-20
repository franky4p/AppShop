//
//  ChangeDataUserRequestFactory.swift
//  AppShop
//
//  Created by Pavel Khlebnikov on 26.07.2021.
//

import Alamofire

protocol ChangeUserDataRequestFactory {
    func changeUserData(userName: String, password: String, email: String, gender: String, completionHandler: @escaping (AFDataResponse<ChangeUserDataResult>) -> Void)
}

