//
//  ProductRequestFactory.swift
//  AppShop
//
//  Created by Pavel Khlebnikov on 04.08.2021.
//

import Alamofire

protocol ProductRequestFactory {
    func getProduct(idProduct: Int, completionHandler: @escaping (AFDataResponse<ProductResult>) -> Void)
}
