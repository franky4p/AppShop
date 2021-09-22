//
//  ReviewsTableViewController.swift
//  AppShop
//
//  Created by Pavel Khlebnikov on 22.09.2021.
//

import UIKit

class ReviewsTableViewController: UITableViewController {

    var productId: Int?
    var reviews: [Review]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadReviews()
        
        tableView.register(ReviewTableViewCell.self, forCellReuseIdentifier: "reviewCellId")
    }

    private func loadReviews() {
        AppSession.shared.requestFactory.makeListReviewRequestFactory().getListReviews(pageNumber: 1, idProduct: productId ?? 0) { [weak self] response in
            switch response.result {
            case .success(let answer):
                DispatchQueue.main.async {
                    self?.reviews = answer.reviews
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
        return reviews?.count ?? 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reviewCellId", for: indexPath) as! ReviewTableViewCell
        if let currentReview = reviews?[indexPath.row] {
            cell.review = currentReview
        }
        return cell
    }
}
