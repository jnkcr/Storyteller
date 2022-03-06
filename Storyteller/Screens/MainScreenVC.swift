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
        
        if Auth.auth().currentUser == nil {
            segueToWelcomeScreen()
        }
    }
    
    @IBAction func signoutAction(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            segueToWelcomeScreen()
        } catch {
            print(error.localizedDescription)
        }
    }
    
}

private extension MainScreenVC {
    
    func segueToWelcomeScreen() {
        performSegue(withIdentifier: "toWelcomeScreen", sender: nil)
    }
    
}
