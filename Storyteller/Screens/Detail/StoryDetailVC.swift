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
    @IBOutlet weak var stepperLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var sliderLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Story"
        // Character description
        let character = storyDetailVM.getCharacter(named: name!)
        titleLabel.text = character.name
        gameLabel.text = character.game
        descriptionLabel.text = character.description
        // Targets
        stepper.addTarget(self, action: #selector(stepperValueChanged), for: .valueChanged)
        slider.addTarget(self, action: #selector(sliderValueChanged), for: .valueChanged)
    }
    
}

// MARK: - Target functions

extension StoryDetailVC {
    
    @objc func stepperValueChanged() {
        stepperLabel.text = "Step: \(Int(stepper.value))"
    }
    
    @objc func sliderValueChanged() {
        sliderLabel.text = "Value: " + String(format: "%.2f", slider.value)
    }
    
}
