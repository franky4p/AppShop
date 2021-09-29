//
//  BasketTableViewCell.swift
//  AppShop
//
//  Created by Pavel Khlebnikov on 27.09.2021.
//

import UIKit

class BasketTableViewCell: UITableViewCell {

    var product : Product? {
        didSet {
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
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let stackView = UIStackView(arrangedSubviews: [nameLabel, priceLabel])
        stackView.distribution = .equalSpacing
        stackView.axis = .horizontal
        stackView.spacing = 2
        addSubview(stackView)
        stackView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 5, paddingLeft: 5, paddingBottom: 5, paddingRight: 5, width: 0, height: 40, enableInsets: false)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
