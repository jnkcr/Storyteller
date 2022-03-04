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
        title = "Sign up"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        invalidLabel.alpha = 0
    }
    
    @IBAction func signupAction(_ sender: Any) {
        // Hide invalid label (it might have been triggered before)
        invalidLabel.alpha = 0
        // Unwrap textfields
        guard let email = emailTextField.text else { return }
        guard let password01 = password01TextField.text else { return }
        guard let password02 = password02TextField.text else { return }
        // Email validation
        // ----- some code here ----
        // Password validation
        guard password01.count > 6 else {
            invalidLabel.alpha = 1
            return
        }
        guard password01 == password02 else {
            invalidLabel.alpha = 1
            return
        }
        // Create user
        Auth.auth().createUser(withEmail: email, password: password01) { [weak self] result, error in
            guard let sSelf = self else { return }
            guard error == nil else {
                sSelf.invalidLabel.alpha = 1
                return
            }
        }
    }
    
}
