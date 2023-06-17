//
//  ViewModule.swift
//  NewsMagazine
//
//  Created by Даниил Попов on 16.06.2023.
//

import Foundation

class ViewModule {
    var statusText = Dynamic("")
    
    func userButtonPressed(login: String, password: String) {
        if login != User.logins[0].login || password != User.logins[0].password {
            statusText.value = "Log in failed."
        } else {
            statusText.value = "You successfully logged in."            
        }
    }
}
