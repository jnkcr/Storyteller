//
//  StoryDetailVC.swift
//  Storyteller
//
//  Created by Jan Kučera on 08.03.2022.
//

import UIKit

class StoryDetailVC: UIViewController {
    
    var name: String?
    let storyDetailVM = StoryDetailVM()
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var gameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Story"
        let character = storyDetailVM.getCharacter(named: name!)
        titleLabel.text = character.name
        gameLabel.text = character.game
        descriptionLabel.text = character.description
    }
    
}
