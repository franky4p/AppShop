//
//  LoginViewController.swift
//  AppShop
//
//  Created by Pavel Khlebnikov on 08.09.2021.
//

import UIKit

class LoginViewController: UIViewController {

    private let loginLabel : UILabel = {
        let label = FactoryUI.createLabel()
        label.text = "Login:"
        return label
    }()
    
    private let loginField : UITextField = {
        let field = FactoryUI.createTextField()
        return field
    }()
    
    private let paswrdLabel : UILabel = {
        let label = FactoryUI.createLabel()
        label.text = "Password:"
        return label
    }()
    
    private let paswrdField : UITextField = {
        let field = FactoryUI.createTextField()
        field.isSecureTextEntry = true
        return field
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addStack(paddingTop: 150, arrangedSubviews: [loginLabel, loginField])
        setWidthTextField(loginField)
        
        addStack(paddingTop: 195, arrangedSubviews: [paswrdLabel, paswrdField])
        setWidthTextField(paswrdField)
        
        self.view.backgroundColor = .yellow
    }
    
    private func addStack(paddingTop: CGFloat, arrangedSubviews: Array<UIView>) {
        let stackView = UIStackView(arrangedSubviews: arrangedSubviews)
        stackView.distribution = .equalSpacing
        stackView.axis = .horizontal
        stackView.spacing = 2
        self.view.addSubview(stackView)
        stackView.anchor(top: self.view.topAnchor, left: self.view.leftAnchor, bottom: nil, right: self.view.rightAnchor, paddingTop: paddingTop, paddingLeft: 100, paddingBottom: 0, paddingRight: 100, width: 0, height: 40, enableInsets: false)
    }

    private func setWidthTextField(_ field: UITextField) {
        field.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 120, height: 0, enableInsets: false)
    }

}
