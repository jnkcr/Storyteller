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
    @IBOutlet weak var gameYear: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Game detail"
        // Fill in UI
        gameIcon.image = UIImage(named: game?.imageName ?? "dpad.fill")
        gameTitle.text = game?.name
        gameYear.text = String(game?.year ?? 0000)
    }
    
}
