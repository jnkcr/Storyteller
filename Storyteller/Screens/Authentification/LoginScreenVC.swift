//
//  LoginScreenVC.swift
//  Storyteller
//
//  Created by Jan Kučera on 04.03.2022.
//

import UIKit
import FirebaseAuth

class LoginScreenVC: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var invalidLoginLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // UI Config
        title = "Log in"
        // Textfield delegate
        emailTextField.delegate = self
        passwordTextField.delegate = self
        // Gesture
        view.addGestureRecognizer(UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing)))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        invalidLoginLabel.alpha = 0
    }
    
    @IBAction func loginAction(_ sender: Any) {
        loginUser()
    }
    
}

// MARK: - Additional fuctionality

private extension LoginScreenVC {
    
    func loginUser() {
        // Hide invalid label (it might have been triggered before)
        invalidLoginLabel.alpha = 0
        // Unwrap textfields
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        // Email validation
        // ----- some code here ----
        // Password validation
        guard password.count > 5 else {
            invalidLoginLabel.text = "Password: at least 6 characters"
            invalidLoginLabel.alpha = 1
            return
        }
        // Login user
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error in
            guard error == nil else {
                guard let sSelf = self else { return }
                sSelf.invalidLoginLabel.alpha = 1
                print(error?.localizedDescription ?? "Login error")
                return
            }
            // Pop when all went well
            self?.navigationController?.popToRootViewController(animated: true)
        }
    }
    
}

// MARK: - Textfield delegate

extension LoginScreenVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case emailTextField:
            return passwordTextField.becomeFirstResponder()
        default:
            loginUser()
            return textField.resignFirstResponder()
        }
        
    }
    
}
