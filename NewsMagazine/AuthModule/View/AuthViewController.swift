//
//  AuthViewController.swift
//  NewsMagazine
//
//  Created by Даниил Попов on 16.06.2023.
//

import UIKit

class AuthViewController: UIViewController {
    
    var viewModule = ViewModule()
    
    let lableLoginScreen = UILabel()
    let lableLogin = UILabel()
    
    let textFieldLogin: UITextField = {
        let textField = UITextField()
         textField.textColor = .black
         return textField
     }()
    
    let lablePassword = UILabel()
    
    let textFieldPassword: UITextField = {
       let textField = UITextField()
        textField.isSecureTextEntry = true
        textField.textColor = .black
        return textField
    }()
    
    var goButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
        button.setTitle("Go", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 25, weight: .bold)
        button.layer.cornerRadius = 10
        button.backgroundColor = .systemBlue
        return button
    }()

    var lableStatusText: UILabel = {
        let lable = UILabel()
        lable.isHidden = true
        lable.font = .systemFont(ofSize: 20, weight: .light)
        return lable
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackgraundColor()
        createElementsForViewAuth()
        bindViewModule()
        textFieldPassword.delegate = self
        textFieldLogin.delegate = self
    }
    
    func setupBackgraundColor() {
        if self.traitCollection.userInterfaceStyle == .dark {
            view.backgroundColor = .black
            lableLoginScreen.textColor = .white
            lableLogin.textColor = .white
            lablePassword.textColor = .white
        } else {
            view.backgroundColor = .white
            lableLoginScreen.textColor = .black
            lableLogin.textColor = .black
            lablePassword.textColor = .black
        }
    }
    
    @objc func loginButtonPressed(_ sender: UIButton) {
        lableStatusText.isHidden = false
        viewModule.userButtonPressed(login: textFieldLogin.text ?? "", password: textFieldPassword.text ?? "")
        if viewModule.statusText.value == "You successfully logged in." {
            let mainVC = ModuleBuilder.createMainModule()
            self.navigationController?.pushViewController(mainVC, animated: true)
        }
    }
    
    func bindViewModule() {
        viewModule.statusText.bind({ (statusText) in
            DispatchQueue.main.async {
                self.lableStatusText.text = statusText
            }
        })
    }
    
}

extension AuthViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}

extension AuthViewController {
    
    func createElementsForViewAuth() {
        lableLoginScreen.text = "Login Screen"
        lableLoginScreen.font = .systemFont(ofSize: 25, weight: .bold)
//        lableLoginScreen.textColor = .black
        
        lableLogin.text = "Login"
        lableLogin.font = .systemFont(ofSize: 20, weight: .light)
//        lableLogin.textColor = .black
        
        lablePassword.text = "Password"
        lablePassword.font = .systemFont(ofSize: 20, weight: .light)
//        lablePassword.textColor = .black

        textFieldLogin.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        textFieldLogin.layer.cornerRadius = 10
        
        textFieldPassword.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        textFieldPassword.layer.cornerRadius = 10
        
//        goButton.titleLabel?.isEnabled = true
//        goButton.titleLabel?.font = .systemFont(ofSize: 25, weight: .bold)
//        goButton.titleLabel?.text = "Go"
//        goButton.titleLabel?.textColor = .black

        
        view.addSubview(lableLoginScreen)
        view.addSubview(lableLogin)
        view.addSubview(textFieldLogin)
        view.addSubview(lablePassword)
        view.addSubview(textFieldPassword)
        view.addSubview(goButton)
        view.addSubview(lableStatusText)
        
        lableLoginScreen.translatesAutoresizingMaskIntoConstraints = false
        lableLogin.translatesAutoresizingMaskIntoConstraints = false
        textFieldLogin.translatesAutoresizingMaskIntoConstraints = false
        lablePassword.translatesAutoresizingMaskIntoConstraints = false
        textFieldPassword.translatesAutoresizingMaskIntoConstraints = false
        goButton.translatesAutoresizingMaskIntoConstraints = false
        lableStatusText.translatesAutoresizingMaskIntoConstraints = false

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
            goButton.heightAnchor.constraint(equalToConstant: 40),

            lableStatusText.topAnchor.constraint(equalTo: goButton.bottomAnchor, constant: 25),
            lableStatusText.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
        ])
    }
    
}
