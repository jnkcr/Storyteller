//
//  GamesDetailVC.swift
//  Storyteller
//
//  Created by Jan Kučera on 15.03.2022.
//

import UIKit

class GamesDetailVC: UIViewController {
    
    var game: Game?
    
    @IBOutlet weak var gameIcon: UIImageView!
    @IBOutlet weak var gameTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Detail"
        // Fill in UI
        gameIcon.image = UIImage(named: game?.imageName ?? "dpad.fill")
        gameTitle.text = game?.name
    }
    
}
