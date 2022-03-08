//
//  RandomIconGenerator.swift
//  Storyteller
//
//  Created by Jan Kučera on 08.03.2022.
//

import Foundation

enum RandomIconGenerator {
    
    static func generateIcon() -> String {
        let iconNames = ["heart.circle", "cross.circle", "pills.circle", "staroflife.circle", "bed.double.circle"]
        return iconNames.randomElement()!
    }
    
}
