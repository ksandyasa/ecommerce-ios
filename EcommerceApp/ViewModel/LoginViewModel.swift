//
//  LoginViewModel.swift
//  EcommerceApp
//
//  Created by Aprido Sandyasa on 24/01/20.
//  Copyright © 2020 Aprido Sandyasa. All rights reserved.
//

import Foundation

protocol LoginDelegate: class {
    func isValidate(value: Bool, message: String, type: String)
}

class LoginViewModel {
    
    weak var delegate: LoginDelegate?
    
    func validateCredential(username: String, password: String) {
        if (!username.isEmpty) {
            if (password.isEmpty) {
                delegate?.isValidate(value: false, message: "password", type: "empty")
            } else if (password.count < 5) {
                delegate?.isValidate(value: false, message: "password", type: "length")
            } else {
                delegate?.isValidate(value: true, message: "all", type: "success")
            }
        } else {
            delegate?.isValidate(value: false, message: "username", type: "empty")
        }
    }
    
}
