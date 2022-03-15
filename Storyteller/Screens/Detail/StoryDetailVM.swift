//
//  StoryDetailVM.swift
//  Storyteller
//
//  Created by Jan Kučera on 09.03.2022.
//

import Foundation

struct StoryDetailVM {
    
    struct Character {
        let name: String
        let game: String
        let description: String
    }
    
    private let characters = [
        Character(name: "Ezio", game: "Assassins Creed: Brotherhood", description: "Ezio Auditore da Firenze (1459 – 1524) was a Florentine nobleman during the Renaissance, and, unbeknownst to most historians and philosophers, a Master Assassin and the Mentor of the Italian Brotherhood of Assassins, a title which he held from 1503 to 1513. He is also an ancestor of William and Desmond Miles, as well as Clay Kaczmarek."),
        Character(name: "Altair", game: "Assassins Creed", description: "Altaïr Ibn-La'Ahad (الطائر ابن لا أحد‎, 1165 – 1257) was a member of the Levantine Brotherhood of Assassins who served as their Mentor from 1191 until his death in 1257.\nDuring his tenure as Mentor, through the knowledge of an Apple of Eden, Altaïr made several discoveries and inventions that greatly helped the Order's progression. His leadership saw to the spread of the Assassins' influence throughout the Old World."),
        Character(name: "Kassandra", game: "Assassins Creed: Oddysey", description: "Kassandra (Greek: Κασσανδρα; 458 BCE – 2018 CE), also known as the Eagle Bearer, West Wind, or Keeper, was a Spartan mercenary who operated in Greece during the Peloponnesian War.\nShe was the older half-sister of Alexios and, through her mother, Myrrine, the granddaughter of King Leonidas I of Sparta. Although raised by her step-father, Nikolaos, Kassandra was the biological daughter of Pythagoras. She was also the mother of Elpidios, an ancestor of Aya, one of the co-founders of the Hidden Ones."),
        Character(name: "Alexios", game: "Assassins Creed: Oddysey", description: "Alexios (Greek: Αλεξιος; 451 BCE – 422 BCE), also known as Deimos, was a Sage of the Cult of Kosmos, an organization based in ancient Greece.\nAlongside his half-sister, the famed misthios Kassandra the Eagle Bearer, he was a grandchild of King Leonidas I of Sparta through his mother, Myrrine, and a Hybrid. His unique heritage made him the target of the Cult of Kosmos as an infant and a false oracle delivered by the Cult deceived Sparta into believing he had to be thrown off Mount Taygetos to his death."),
        Character(name: "Bayek", game: "Assassins Creed: Origins", description: "Bayek of Siwa (born c. 85 BCE), also known by the alias Amun, was one of the last Medjay of Egypt and the founder of the Hidden Ones alongside his wife, Aya.\nGrowing up in the remote village of Siwa, Bayek inherited the mantle of Medjay from his father, Sabu, and dedicated his life to protecting the security and welfare of his people."),
    ]
    
    func getCharacter(named name: String) -> Character {
        characters.filter({ $0.name.contains(name) }).first!
    }
    
}
