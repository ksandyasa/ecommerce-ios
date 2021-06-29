//
//  LoginVC.swift
//  EcommerceApp
//
//  Created by Aprido Sandyasa on 24/01/20.
//  Copyright © 2020 Aprido Sandyasa. All rights reserved.
//

import Foundation
import UIKit


class LoginVC: UIViewController, LoginDelegate {
    
    @IBOutlet weak var userField: UITextField!
    @IBOutlet weak var passField: UITextField!
    
    lazy var viewModel: LoginViewModel = {
        let viewModel = LoginViewModel()
        
        return viewModel
    }()
    
    @IBAction func SignIn(sender: Any) {
        print("Login")
        viewModel.validateCredential(username: userField.text!, password: passField.text!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewModel.delegate = self        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func isValidate(value: Bool, message: String, type: String) {
        var alertMessage = ""
        if (value == false) {
            if (message == "username" && type == "empty") {
                alertMessage = "Username is empty"
            } else if (message == "password" && type == "empty") {
                alertMessage = "Password is empty"
            } else if (message == "password" && type == "length") {
                alertMessage = "Password length must be more than 4 character"
            }
            showAlertToUI(message: alertMessage)
        } else {
            let tabBarVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TabBarVC") as! TabBarVC
            self.navigationController?.pushViewController(tabBarVC, animated: true)

        }
    }
    
    func showAlertToUI(message: String) {
        let warningAlert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        warningAlert.addAction(UIAlertAction(title: NSLocalizedString("Close", comment: ""), style: .default, handler: {action in}))
        present(warningAlert, animated: true, completion: nil)
    }
    
}
