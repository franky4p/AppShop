//
//  RegistrationViewController.swift
//  AppShop
//
//  Created by Pavel Khlebnikov on 08.09.2021.
//

import UIKit

class UserDataViewController: UIViewController {

    private let loginLabel : UILabel = {
        let label = FactoryUI.createLabel()
        label.text = NSLocalizedString("Логин:", comment: "")
        return label
    }()
    
    private let paswrdLabel : UILabel = {
        let label = FactoryUI.createLabel()
        label.text = NSLocalizedString("Пароль:", comment: "")
        return label
    }()
    
    private let nameLabel : UILabel = {
        let label = FactoryUI.createLabel()
        label.text = NSLocalizedString("Имя:", comment: "")
        return label
    }()
    
    private let lastNameLabel : UILabel = {
        let label = FactoryUI.createLabel()
        label.text = NSLocalizedString("Фамилия:", comment: "")
        return label
    }()
    
    private let loginField : UITextField = {
        return FactoryUI.createTextField()
    }()
    
    private let paswrdField : UITextField = {
        let field = FactoryUI.createTextField()
        field.isSecureTextEntry = true
        return field
    }()
    
    private let nameField : UITextField = {
        return FactoryUI.createTextField()
    }()
    
    private let lastNameField : UITextField = {
        return FactoryUI.createTextField()
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addStack(paddingTop: 150, arrangedSubviews: [loginLabel, loginField])
        FactoryUI.setWidthTextField(loginField, width: 200)
        
        addStack(paddingTop: 195, arrangedSubviews: [paswrdLabel, paswrdField])
        FactoryUI.setWidthTextField(paswrdField, width: 200)
        
        addStack(paddingTop: 240, arrangedSubviews: [nameLabel, nameField])
        FactoryUI.setWidthTextField(nameField, width: 200)
        
        addStack(paddingTop: 285, arrangedSubviews: [lastNameLabel, lastNameField])
        FactoryUI.setWidthTextField(lastNameField, width: 200)

        let button = FactoryUI.createButton(view, hightY: 330)
        button.setTitle(NSLocalizedString("Сохранить", comment: ""), for: .normal)
        button.addTarget(self, action: #selector(saveUserData), for: .touchUpInside)
        view.addSubview(button)
        
        self.view.backgroundColor = .yellow
    }
    
    private func addStack(paddingTop: CGFloat, arrangedSubviews: Array<UIView>) {
        let stackView = UIStackView(arrangedSubviews: arrangedSubviews)
        stackView.distribution = .equalSpacing
        stackView.axis = .horizontal
        stackView.spacing = 2
        self.view.addSubview(stackView)
        stackView.anchor(top: self.view.topAnchor, left: self.view.leftAnchor, bottom: nil, right: self.view.rightAnchor, paddingTop: paddingTop, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 40, enableInsets: false)
    }
    
    @objc func saveUserData() {
        print("Данные сохранены")
    }
}
