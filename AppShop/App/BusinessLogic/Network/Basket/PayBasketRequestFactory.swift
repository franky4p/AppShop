//
//  PayBasketRequestFactory.swift
//  AppShop
//
//  Created by Pavel Khlebnikov on 30.08.2021.
//

import Alamofire

protocol PayBasketRequestFactory {
    func payBasket(userId: Int, completionHandler: @escaping (AFDataResponse<OperationResult>) -> Void)
}
