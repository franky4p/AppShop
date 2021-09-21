//
//  AppSession.swift
//  AppShop
//
//  Created by Pavel Khlebnikov on 21.09.2021.
//

import UIKit

final class AppSession {
    var userId: Int?
    let requestFactory = RequestFactory()
    
    static let shared = AppSession()
    
    private init() {}
    
    func login(userName: String, userPassword: String, complition: @escaping () -> ()) {
        requestFactory.makeAuthRequestFatory().login(userName: userName, password: userPassword) { [weak self] response in
            switch response.result {
            case .success(let login):
                self?.userId = login.user.id
                complition()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
