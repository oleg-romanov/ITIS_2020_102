//
//  ViewController.swift
//  Homework2
//
//  Created by Олег Романов on 18.09.2020.
//  Copyright © 2020 Oleg Romanov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private let loginCustomView: LoginView = LoginView()
    private let signUpCustomView: SignUpView = SignUpView()
    
    private var dictionary: [String: String] = ["admin" : "admin", "qwerty" : "qwerty"]

    override func loadView() {
        view = loginCustomView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginCustomView.delegate = self
        signUpCustomView.delegate = self
    }
}

extension ViewController: SignInDelegate {
    func login(login: String, password: String) {
        var isCorrect: Bool = false
        for key in dictionary {
            if key.key == login && key.value == password {
                isCorrect = true
            }
            loginCustomView.changeHeaderView(isCorrect: isCorrect)
        }
    }
    
    func signUp() {
  //    signUpCustomView.delegate = self
        view = signUpCustomView
    }
    
}

extension ViewController: SignUpDelegate {    
    func goToLoginView() {
        loginCustomView.resetHeaderView()
        view = loginCustomView
    }
    
    func addNewPerson(login: String, password: String) {
        dictionary.updateValue(password, forKey: login)
        print(dictionary)
        view = loginCustomView
    }
}

