//
//  User.swift
//  NewsMagazine
//
//  Created by Даниил Попов on 16.06.2023.
//

import Foundation

struct User {
    let login: String?
    let password: String?
}

extension User {
    static var logins = [
    User(login: "Daniil", password: "12345")
    ]
}
