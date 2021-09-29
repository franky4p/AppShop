//
//  AppSession.swift
//  AppShop
//
//  Created by Pavel Khlebnikov on 21.09.2021.
//

import UIKit

final class AppSession {
    var user: User?
    var basket = [Product]()
    let requestFactory = RequestFactory()
    
    static let shared = AppSession()
    
    private init() {}
    
    func login(userName: String, userPassword: String, complition: @escaping () -> ()) {
        requestFactory.makeAuthRequestFatory().login(userName: userName, password: userPassword) { [weak self] response in
            switch response.result {
            case .success(let login):
                self?.user = login.user
                complition()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func addToBasket(_ product: Product) {
        requestFactory.makeChangeBasketRequestFactory().addToBasket(productId: product.id, amount: 1) { [weak self] response in
            switch response.result {
            case .success(_):
                self?.basket.append(product)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func payBasket(complition: @escaping () -> ()) {
        guard let userId = user?.id else { return }
        
        requestFactory.makePayBasketRequestFactory().payBasket(userId: userId) { [weak self] response in
            switch response.result {
            case .success(_):
                self?.basket = []
                complition()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
