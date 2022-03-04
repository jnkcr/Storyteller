//
//  WelcomeScreenVC.swift
//  Storyteller
//
//  Created by Jan Kučera on 04.03.2022.
//

import UIKit
import FirebaseAuth

class WelcomeScreenVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if Auth.auth().currentUser != nil {
            performSegue(withIdentifier: "toMainScreen", sender: nil)
        }
    }
    
}
