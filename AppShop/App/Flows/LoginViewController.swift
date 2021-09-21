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
        label.text = NSLocalizedString("Логин:", comment: "")
        return label
    }()
    
    private let loginField : UITextField = {
        let field = FactoryUI.createTextField()
        return field
    }()
    
    private let paswrdLabel : UILabel = {
        let label = FactoryUI.createLabel()
        label.text = NSLocalizedString("Пароль:", comment: "")
        return label
    }()
    
    private let paswrdField : UITextField = {
        let field = FactoryUI.createTextField()
        field.isSecureTextEntry = true
        return field
    }()
    
    private let registerLabel : UILabel = {
        let label = FactoryUI.createLabel()
        label.isUserInteractionEnabled = true
        label.textColor = .blue
        label.text = NSLocalizedString("Нет логина?", comment: "")
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addStack(paddingTop: 150, arrangedSubviews: [loginLabel, loginField])
        FactoryUI.setWidthTextField(loginField, width: 120)
        
        addStack(paddingTop: 195, arrangedSubviews: [paswrdLabel, paswrdField])
        FactoryUI.setWidthTextField(paswrdField, width: 120)
        
        view.addSubview(registerLabel)
        registerLabel.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 240, paddingLeft: 160, paddingBottom: 0, paddingRight: 100, width: 0, height: 40, enableInsets: false)
        let tap = UITapGestureRecognizer(target: self, action: #selector(onClicRegisterLabel))
        registerLabel.addGestureRecognizer(tap)
        
        let button = FactoryUI.createButton(view, hightY: 280)
        button.setTitle(NSLocalizedString("Войти", comment: ""), for: .normal)
        button.addTarget(self, action: #selector(login), for: .touchUpInside)
        view.addSubview(button)
        
        view.backgroundColor = .yellow
    }
    
    private func addStack(paddingTop: CGFloat, arrangedSubviews: Array<UIView>) {
        let stackView = UIStackView(arrangedSubviews: arrangedSubviews)
        stackView.distribution = .equalSpacing
        stackView.axis = .horizontal
        stackView.spacing = 2
        view.addSubview(stackView)
        stackView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: paddingTop, paddingLeft: 100, paddingBottom: 0, paddingRight: 100, width: 0, height: 40, enableInsets: false)
    }

    @objc func login() {
        AppSession.shared.login(userName: loginField.text ?? "", userPassword: paswrdField.text ?? "") {
            if (AppSession.shared.userId != nil) {
                DispatchQueue.main.async {
                    UIApplication.shared.windows.first?.rootViewController = TabBarController()
                }
            } else {
                print("Не корректные данные")
            }
        }
    }
    
    @objc func onClicRegisterLabel() {
        let registerViewController = UserDataViewController()
        
        UIApplication.shared.windows.first?.rootViewController = registerViewController
        //self.navigationController?.pushViewController(registerViewController, animated: true)
    }
}
