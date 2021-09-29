//
//  FactoryUI.swift
//  AppShop
//
//  Created by Pavel Khlebnikov on 08.09.2021.
//

import Foundation

import UIKit

final class FactoryUI {
    static func createLabel() -> UILabel {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.textAlignment = .left
        return lbl
    }
    
    static func createTextField() -> UITextField {
        let textField = UITextField()
        textField.textAlignment = .left
        textField.textColor = .black
        textField.borderStyle = .roundedRect
        textField.clearButtonMode = .whileEditing
        return textField
    }
    
    static func createButton(_ headerView: UIView, hightY: CGFloat) -> UIButton {
        let button = UIButton()
        button.frame = CGRect.init(x: headerView.frame.width / 2 / 2, y: hightY, width: headerView.frame.width / 2, height: 50)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.alpha = 0.8
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        return button
    }
    
    static func setWidthTextField(_ field: UITextField, width: CGFloat) {
        field.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: width, height: 0, enableInsets: false)
    }
}
