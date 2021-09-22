//
//  ReviewTableViewCell.swift
//  AppShop
//
//  Created by Pavel Khlebnikov on 22.09.2021.
//

import UIKit

class ReviewTableViewCell: UITableViewCell {

    var review : Review? {
        didSet {
            textReviewLabel.text = NSLocalizedString("\(review?.textReview ?? "")", comment: "")
        }
    }
    
    private let textReviewLabel : UILabel = {
        let lbl = FactoryUI.createLabel()
        lbl.numberOfLines = 0
        return lbl
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(textReviewLabel)
        textReviewLabel.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 5, paddingBottom: 0, paddingRight: 10, width: bounds.size.width - 10, height: 0, enableInsets: false)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
