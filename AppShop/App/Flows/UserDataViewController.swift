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
    
    private let emailLabel : UILabel = {
        let label = FactoryUI.createLabel()
        label.text = NSLocalizedString("Почта:", comment: "")
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
    
    private let emailField : UITextField = {
        return FactoryUI.createTextField()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addElementsUI()
        fillValueFields()
        view.backgroundColor = .white
    }
    
    private func addElementsUI() {
        let widthTextField = view.frame.width / 2
        
        addStack(paddingTop: 150, arrangedSubviews: [loginLabel, loginField])
        FactoryUI.setWidthTextField(loginField, width: widthTextField)
        
        addStack(paddingTop: 195, arrangedSubviews: [paswrdLabel, paswrdField])
        FactoryUI.setWidthTextField(paswrdField, width: widthTextField)
        
        addStack(paddingTop: 240, arrangedSubviews: [nameLabel, nameField])
        FactoryUI.setWidthTextField(nameField, width: widthTextField)
        
        addStack(paddingTop: 285, arrangedSubviews: [lastNameLabel, lastNameField])
        FactoryUI.setWidthTextField(lastNameField, width: widthTextField)
        
        addStack(paddingTop: 330, arrangedSubviews: [emailLabel, emailField])
        FactoryUI.setWidthTextField(emailField, width: widthTextField)
        
        let button = FactoryUI.createButton(view, hightY: 375)
        if AppSession.shared.user != nil {
            button.setTitle(NSLocalizedString("Сохранить", comment: ""), for: .normal)
        } else {
            button.setTitle(NSLocalizedString("Зарегистрироваться", comment: ""), for: .normal)
        }
        button.addTarget(self, action: #selector(saveUserData), for: .touchUpInside)
        view.addSubview(button)
    }
    
    private func addStack(paddingTop: CGFloat, arrangedSubviews: Array<UIView>) {
        let stackView = UIStackView(arrangedSubviews: arrangedSubviews)
        stackView.distribution = .equalSpacing
        stackView.axis = .horizontal
        stackView.spacing = 2
        self.view.addSubview(stackView)
        stackView.anchor(top: self.view.topAnchor, left: self.view.leftAnchor, bottom: nil, right: self.view.rightAnchor, paddingTop: paddingTop, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 40, enableInsets: false)
    }
    
    private func fillValueFields() {
        loginField.text = AppSession.shared.user?.login
        nameField.text = AppSession.shared.user?.name
        lastNameField.text = AppSession.shared.user?.lastName
    }
    
    @objc func saveUserData() {
        if AppSession.shared.user != nil {
            AppSession.shared.requestFactory.makeChageUserDataRequestFactory().changeUserData(userName: loginField.text ?? "", password: paswrdField.text ?? "", email: emailField.text ?? "", gender: "m") { [weak self] response in
                switch response.result {
                case .success(_):
                    DispatchQueue.main.async {
                        let alert  = UIAlertController(title: NSLocalizedString("Информация", comment: ""), message: NSLocalizedString("Данные обновлены", comment: "") , preferredStyle: .alert)
                        let okAction = UIAlertAction(title: "OK ", style: .default, handler: nil)
                        alert.addAction(okAction)
                        self?.present(alert, animated: true, completion: nil)
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        } else {
            AppSession.shared.requestFactory.makeRegistrationRequestFactory().register(userName: loginField.text ?? "", password: paswrdField.text ?? "") { response in
                switch response.result {
                case .success(_):
                    DispatchQueue.main.async {
                        UIApplication.shared.windows.first?.rootViewController = LoginViewController()
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}
