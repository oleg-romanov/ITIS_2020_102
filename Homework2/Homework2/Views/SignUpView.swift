//
//  SignUpView.swift
//  Homework2
//
//  Created by Олег Романов on 18.09.2020.
//  Copyright © 2020 Oleg Romanov. All rights reserved.
//

import UIKit

class SignUpView: UIView {
    weak var delegate: SignInDelegate?
    
    var headerLabel: UILabel = {
       let label = UILabel()
        label.text = "Already signed up?"
        label.textColor = UIColor.white
        label.frame = CGRect(x: 50, y: 60, width: UIScreen.main.bounds.width, height: 30)
       return label
    } ()
    
    var headerView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 150)
        view.backgroundColor = UIColor.lightGray
        return view
    } ()
    
    var loginTextField: UITextField = {
        let textField = UITextField()
        textField.frame = CGRect(x: UIScreen.main.bounds.width * 0.25, y: 200, width: UIScreen.main.bounds.width * 0.5, height: 40)
        textField.borderStyle = .line
        textField.placeholder = "login"
        textField.autocapitalizationType = .none
        return textField
    } ()
    
    var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.frame = CGRect(x: UIScreen.main.bounds.width * 0.25, y: 250, width: UIScreen.main.bounds.width * 0.5, height: 40)
        textField.borderStyle = .line
        textField.placeholder = "password"
        textField.isSecureTextEntry = true
        return textField
    } ()
    
    var confirmPasswordTextField: UITextField = {
        let textField = UITextField()
        textField.frame = CGRect(x: UIScreen.main.bounds.width * 0.25, y: 300, width: UIScreen.main.bounds.width * 0.5, height: 40)
        textField.borderStyle = .line
        textField.placeholder = "confirm password"
        textField.isSecureTextEntry = true
        return textField
    } ()
    
    var signUpButton: UIButton = {
       let button = UIButton()
        button.frame = CGRect(x: UIScreen.main.bounds.width * 0.5 - 100, y: 350, width: 100, height: 60)
        button.backgroundColor = UIColor.systemPurple
        button.setTitle("Sign Up", for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(signUpButtonClicked), for: .touchUpInside)
       return button
    } ()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupStyle() {
        backgroundColor = UIColor.systemBlue
        addSubviews()
    }
    
    private func addSubviews() {
        addSubview(headerView)
        addSubview(headerLabel)
        addSubview(loginTextField)
        addSubview(passwordTextField)
        addSubview(confirmPasswordTextField)
        addSubview(signUpButton)
    }
    
    @objc private func signUpButtonClicked() {
        
        guard
            let login = loginTextField.text,
            let password = passwordTextField.text,
            let confirmPass = confirmPasswordTextField.text,
            password.isEmpty == false
        else {
            print("Error!")
            return
        }
        if password == confirmPass {
            delegate?.addNewPerson(login: login, password: password)
        } else {
            print("Пароли не совпадают...")
        }
    }
}