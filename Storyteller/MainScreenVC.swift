//
//  MainScreenVC.swift
//  Storyteller
//
//  Created by Jan Kučera on 04.03.2022.
//

import UIKit
import FirebaseAuth

class MainScreenVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Main screen"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Hides back button
        navigationController?.navigationBar.topItem?.hidesBackButton = true
    }
    
    @IBAction func signoutAction(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            navigationController?.popViewController(animated: true)
        } catch {
            print(error.localizedDescription)
        }
    }
    
}
