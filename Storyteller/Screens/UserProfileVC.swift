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

    override func viewDidLoad() {
        super.viewDidLoad()
        title = user?.email ?? "Profile"
    }
    
    @IBAction func signoutButtonAction(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            dismiss(animated: true)
        } catch {
            print(error.localizedDescription)
        }
    }
    
}
