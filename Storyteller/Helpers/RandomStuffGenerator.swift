//
//  RandomIconGenerator.swift
//  Storyteller
//
//  Created by Jan Kučera on 08.03.2022.
//

import Foundation

enum RandomStuffGenerator {
    
    static func generateIcon() -> String {
        let iconNames = ["heart.circle", "cross.circle", "pills.circle", "staroflife.circle", "bed.double.circle"]
        return iconNames.randomElement()!
    }
    
    static func generateName() -> String {
        let names = ["Alexios", "Kassandra", "Ezio", "Altair", "Bayek"]
        return names.randomElement()!
    }
    
}
