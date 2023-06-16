//
//  AuthViewController.swift
//  NewsMagazine
//
//  Created by Даниил Попов on 16.06.2023.
//

import UIKit

class AuthViewController: UIViewController {
    
    let lableLoginScreen = UILabel()
    let lableLogin = UILabel()
    let textFieldLogin = UITextField()
    let lablePassword = UILabel()
    let textFieldPassword = UITextField()
    
    var goButton: UIButton = {
       let button = UIButton()
        button.addTarget(AuthViewController.self, action: #selector(loginButtonPressed), for: .touchUpInside)
        return button
    }()
    
    var statusText: UILabel = {
        let lable = UILabel()
        lable.isEnabled = false
        lable.font = .systemFont(ofSize: 20, weight: .light)
        return lable
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        createElementsForViewAuth()
    }
    
    @objc func loginButtonPressed() {
        
    }
    
}

extension AuthViewController {
    
    func createElementsForViewAuth() {
        lableLoginScreen.text = "Login Screen"
        lableLoginScreen.font = .systemFont(ofSize: 25, weight: .bold)
        lableLoginScreen.textColor = .black
        
        lableLogin.text = "Login"
        lableLogin.font = .systemFont(ofSize: 20, weight: .light)
        
        lablePassword.text = "Password"
        lablePassword.font = .systemFont(ofSize: 20, weight: .light)
        
        textFieldLogin.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        textFieldLogin.layer.cornerRadius = 10
        
        textFieldPassword.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        textFieldPassword.layer.cornerRadius = 10
        
        goButton.titleLabel?.isEnabled = true
        goButton.titleLabel?.font = .systemFont(ofSize: 25, weight: .bold)
        goButton.titleLabel?.text = "Go"
        goButton.titleLabel?.textColor = .black
        goButton.layer.cornerRadius = 10
        goButton.backgroundColor = .systemBlue
        
        view.addSubview(lableLoginScreen)
        view.addSubview(lableLogin)
        view.addSubview(textFieldLogin)
        view.addSubview(lablePassword)
        view.addSubview(textFieldPassword)
        view.addSubview(goButton)
        view.addSubview(statusText)
        
        lableLoginScreen.translatesAutoresizingMaskIntoConstraints = false
        lableLogin.translatesAutoresizingMaskIntoConstraints = false
        textFieldLogin.translatesAutoresizingMaskIntoConstraints = false
        lablePassword.translatesAutoresizingMaskIntoConstraints = false
        textFieldPassword.translatesAutoresizingMaskIntoConstraints = false
        goButton.translatesAutoresizingMaskIntoConstraints = false
        statusText.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            lableLoginScreen.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            lableLoginScreen.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            
            lableLogin.topAnchor.constraint(equalTo: lableLoginScreen.bottomAnchor, constant: 10),
            lableLogin.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),

            textFieldLogin.topAnchor.constraint(equalTo: lableLogin.bottomAnchor, constant: 10),
            textFieldLogin.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textFieldLogin.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            textFieldLogin.heightAnchor.constraint(equalToConstant: 50),

            lablePassword.topAnchor.constraint(equalTo: textFieldLogin.bottomAnchor, constant: 10),
            lablePassword.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),

            textFieldPassword.topAnchor.constraint(equalTo: lablePassword.bottomAnchor, constant: 10),
            textFieldPassword.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textFieldPassword.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            textFieldPassword.heightAnchor.constraint(equalToConstant: 50),
            
            goButton.topAnchor.constraint(equalTo: textFieldPassword.bottomAnchor, constant: 25),
            goButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 120),
            goButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -120),
            goButton.heightAnchor.constraint(equalToConstant: 40)

        ])
    }
    
}
