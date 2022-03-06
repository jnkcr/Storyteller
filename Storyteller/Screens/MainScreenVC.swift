//
//  MainScreenVC.swift
//  Storyteller
//
//  Created by Jan Kučera on 04.03.2022.
//

import UIKit
import FirebaseAuth

class MainScreenVC: UIViewController {
    
    private var user: User?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Main screen"
        // Add authentification listener
        Auth.auth().addStateDidChangeListener { [weak self] authentication, user in
            if user != nil {
                self?.user = user
            } else {
                self?.segueToWelcomeScreen()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? UserProfileVC {
            dest.user = user
        }
    }
    
}

private extension MainScreenVC {
    
    func segueToWelcomeScreen() {
        performSegue(withIdentifier: "toWelcomeScreen", sender: nil)
    }
    
}
