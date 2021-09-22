//
//  ProductsTableViewController.swift
//  AppShop
//
//  Created by Pavel Khlebnikov on 21.09.2021.
//

import UIKit

class ProductsTableViewController: UITableViewController {

    var products: [Product]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadProducts()
        tableView.register(ProductTableViewCell.self, forCellReuseIdentifier: "productCellId")
    }

    private func loadProducts() {
        AppSession.shared.requestFactory.makeListProductsRequestFactory().getListProducts(pageNumber: 1, idCategory: 1) { [weak self] response in
            switch response.result {
            case .success(let answer):
                DispatchQueue.main.async {
                    self?.products = answer.products
                    self?.tableView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products?.count ?? 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "productCellId", for: indexPath) as! ProductTableViewCell
        if let currentProduct = products?[indexPath.row] {
            cell.product = currentProduct
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vController = ReviewsTableViewController()
        vController.productId = products?[indexPath.row].id
        
        self.navigationController?.pushViewController(vController, animated: true)
    }
}
