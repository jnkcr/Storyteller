//
//  StoryDetailVC.swift
//  Storyteller
//
//  Created by Jan Kučera on 08.03.2022.
//

import UIKit

class StoryDetailVC: UIViewController {
    
    var name: String?
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Story"
        titleLabel.text = name
    }
    
}
