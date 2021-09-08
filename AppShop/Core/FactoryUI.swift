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
}
