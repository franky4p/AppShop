//
//  ProductTableViewCell.swift
//  AppShop
//
//  Created by Pavel Khlebnikov on 21.09.2021.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    var product : Product? {
        didSet {
            descriptionLabel.text = NSLocalizedString("\(product?.productDescription ?? "")", comment: "")
            nameLabel.text = NSLocalizedString("\(product?.name ?? "")", comment: "")
            priceLabel.text = NSLocalizedString("цена: \(product?.price ?? 0)", comment: "")
        }
    }
    
    private let nameLabel : UILabel = {
        return FactoryUI.createLabel()
    }()
    
    private let priceLabel : UILabel = {
        return FactoryUI.createLabel()
    }()
    
    private let descriptionLabel : UILabel = {
        let lbl = FactoryUI.createLabel()
        lbl.numberOfLines = 0
        return lbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let stackView = UIStackView(arrangedSubviews: [nameLabel, priceLabel])
        stackView.distribution = .equalSpacing
        stackView.axis = .horizontal
        stackView.spacing = 2
        addSubview(stackView)
        stackView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 5, paddingLeft: 5, paddingBottom: 5, paddingRight: 5, width: 0, height: 40, enableInsets: false)
        
        addSubview(descriptionLabel)
        descriptionLabel.anchor(top: stackView.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 5, paddingBottom: 0, paddingRight: 10, width: bounds.size.width - 10, height: 0, enableInsets: false)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
