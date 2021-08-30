//
//  ChangeUserData.swift
//  AppShop
//
//  Created by Pavel Khlebnikov on 26.07.2021.
//

import Foundation
import Alamofire

class ChangeUserData: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl = Settings.baseUrl
    
    init(errorParser: AbstractErrorParser, sessionManager: Session, queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
}

extension ChangeUserData: ChangeUserDataRequestFactory {
    func changeUserData(userName: String, password: String, email: String, gender: String, completionHandler: @escaping (AFDataResponse<OperationResult>) -> Void) {
        let requestModel = UserData(baseUrl: baseUrl, login: userName, password: password, email: email, gender: gender)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension ChangeUserData {
    struct UserData: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "changeData"
        
        let login: String
        let password: String
        let email: String
        let gender: String
        var parameters: Parameters? {
            ["username": login,
             "password": password,
             "email": email,
             "gender": gender]
        }
    }
}

