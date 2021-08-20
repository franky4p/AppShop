//
//  ListProductsRequestFactory.swift
//  AppShop
//
//  Created by Pavel Khlebnikov on 03.08.2021.
//

import Alamofire

protocol ListProductsRequestFactory {
    func getListProducts(pageNumber: Int, idCategory: Int, completionHandler: @escaping (AFDataResponse<ListProductsResult>) -> Void)
}
