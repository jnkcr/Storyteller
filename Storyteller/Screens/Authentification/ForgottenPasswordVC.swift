//
//  ForgottenPasswordVC.swift
//  Storyteller
//
//  Created by Jan Kučera on 07.03.2022.
//

import UIKit
import FirebaseAuth

class ForgottenPasswordVC: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var validationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // UI Config
        validationLabel.alpha = 0
        // Textfield delegate
        emailTextField.delegate = self
        // Gesture
        view.addGestureRecognizer(UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing)))
    }
    
    @IBAction func confirmationButtonAction(_ sender: Any) {
        sendPasswordResetEmail()
    }
    
    @IBAction func dismissButtonAction(_ sender: Any) {
        dismiss(animated: true)
    }
    
}

// MARK: - Additional functionality

private extension ForgottenPasswordVC {
    
    func sendPasswordResetEmail() {
        // Hide invalid label (it might have been triggered before)
        validationLabel.alpha = 0
        guard let email = emailTextField.text else { return }
        // Email validation
        // ---- Some code here ----
        // Send password reset email
        Auth.auth().sendPasswordReset(withEmail: email) { [weak self] error in
            guard error == nil else {
                self?.validationLabel.text = "Error: Unable to send email"
                self?.validationLabel.alpha = 1
                return
            }
            self?.dismiss(animated: true)
        }
    }
    
}

// MARK: - Textfield delegate

extension ForgottenPasswordVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        sendPasswordResetEmail()
        return textField.resignFirstResponder()
    }
    
}
