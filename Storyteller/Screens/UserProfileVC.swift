//
//  UserProfileVC.swift
//  Storyteller
//
//  Created by Jan Kučera on 06.03.2022.
//

import UIKit
import FirebaseAuth

class UserProfileVC: UIViewController {
    
    var user: User?
    var isEditingProfile: Bool = false
    
    @IBOutlet weak var profileImage: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var editProfileButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // UI Config
        title = "Profile"
        navigationItem.backButtonTitle = "Back"
        // Textfield config
        profileImage.isEnabled = false
        nameTextField.isEnabled = false
        emailTextField.isEnabled = false
        nameTextField.textColor = .secondaryLabel
        emailTextField.textColor = .systemGray
        // Textfield data
        nameTextField.text = user?.displayName
        emailTextField.text = user?.email
        // Textfield delegate
        nameTextField.delegate = self
        emailTextField.delegate = self
        // Gesture
        view.addGestureRecognizer(UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing)))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    @IBAction func editProfileAction(_ sender: Any) {
        if isEditingProfile {
            saveChanges()
        } else {
            enableEditing()
        }
    }
    
    @IBAction func signoutButtonAction(_ sender: Any) {
        signOutUser()
    }
    
    @IBAction func deleteAccountAction(_ sender: Any) {
        
    }
    
    deinit {
        print("Profile is being DEINITIALIZED")
    }
    
}

// MARK: - Additional functionality

private extension UserProfileVC {
    
    func enableEditing() {
        isEditingProfile = true
        profileImage.isEnabled = true
        nameTextField.isEnabled = true
        nameTextField.textColor = .label
        editProfileButton.setTitle("Save changes", for: .normal)
    }
    
    func disableEditing() {
        isEditingProfile = false
        profileImage.isEnabled = false
        nameTextField.isEnabled = false
        nameTextField.textColor = .secondaryLabel
        editProfileButton.setTitle("Edit profile", for: .normal)
    }
    
    func saveChanges() {
        // Check for changes
        guard nameTextField.text != user?.displayName else {
            disableEditing()
            return
        }
        // Start activity indicator
        activityIndicator.startAnimating()
        // Create request
        let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
        changeRequest?.displayName = nameTextField.text
        // Commit changes
        changeRequest?.commitChanges { [weak self] error in
            guard error == nil else { return }
            self?.activityIndicator.stopAnimating()
            self?.disableEditing()
        }
    }
    
    func signOutUser() {
        do {
            try Auth.auth().signOut()
            dismiss(animated: true)
        } catch {
            print(error.localizedDescription)
        }
    }
    
}

// MARK: - Textfield delegate

extension UserProfileVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
}
