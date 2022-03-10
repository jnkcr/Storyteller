//
//  SignupScreenVC.swift
//  Storyteller
//
//  Created by Jan Kučera on 04.03.2022.
//

import UIKit
import FirebaseAuth

class SignupScreenVC: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var password01TextField: UITextField!
    @IBOutlet weak var password02TextField: UITextField!
    @IBOutlet weak var invalidLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // UI Config
        title = "Sign up"
        // Textfield delagate
        emailTextField.delegate = self
        password01TextField.delegate = self
        password02TextField.delegate = self
        // Gesture
        view.addGestureRecognizer(UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing)))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        invalidLabel.alpha = 0
    }
    
    @IBAction func signupAction(_ sender: Any) {
        createUser()
    }
    
}

// MARK: - Additional functionality

private extension SignupScreenVC {
    
    func createUser() {
        // Hide invalid label (it might have been triggered before)
        invalidLabel.alpha = 0
        // Unwrap textfields
        guard let email = emailTextField.text else { return }
        guard let password01 = password01TextField.text else { return }
        guard let password02 = password02TextField.text else { return }
        // Email validation
        let emailPattern = #"^\S+@\S+\.\S+$"#
        let result = email.range(of: emailPattern, options: .regularExpression)
        guard result != nil else {
            invalidLabel.text = "Invalid email format"
            invalidLabel.alpha = 1
            return
        }
        // ----- some code here ----
        // Password validation
        guard password01.count > 5 else {
            invalidLabel.text = "Password: at least 6 characters"
            invalidLabel.alpha = 1
            return
        }
        guard password01 == password02 else {
            invalidLabel.text = "Password: given passwords are not same"
            invalidLabel.alpha = 1
            return
        }
        // Create user
        Auth.auth().createUser(withEmail: email, password: password01) { [weak self] result, error in
            // Display warning when error
            guard error == nil else {
                self?.invalidLabel.alpha = 1
                return
            }
            // pop when all went well
            self?.navigationController?.popToRootViewController(animated: true)
        }
    }
    
}

// MARK: - Textfield delegate

extension SignupScreenVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case emailTextField:
            return password01TextField.becomeFirstResponder()
        case password01TextField:
            return password02TextField.becomeFirstResponder()
        default:
            createUser()
            return textField.resignFirstResponder()
        }
    }
    
}
