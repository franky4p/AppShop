//
//  AddToBasketRequestFactory.swift
//  AppShop
//
//  Created by Pavel Khlebnikov on 30.08.2021.
//

import Alamofire

protocol ChangeBasketRequestFactory {
    func addToBasket(productId: Int, amount: Int, completionHandler: @escaping (AFDataResponse<ChangeBasketResult>) -> Void)
    func delFromBasket(productId: Int, amount: Int, completionHandler: @escaping (AFDataResponse<ChangeBasketResult>) -> Void)
}
