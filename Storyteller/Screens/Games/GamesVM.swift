//
//  GamesVM.swift
//  Storyteller
//
//  Created by Jan Kučera on 14.03.2022.
//

import Foundation

struct Game {
    let name: String
    let imageName: String
    let year: Int
}

final class GamesVM {
    
    private let games = [
        Game(name: "Assasins Creed", imageName: "ac01", year: 2007),
        Game(name: "Assasins Creed II", imageName: "ac02", year: 2009),
        Game(name: "Assasins Creed: Brotherhood", imageName: "acBrotherhood", year: 2010),
        Game(name: "Assasins Creed: Revelations", imageName: "acRevelations", year: 2011),
        Game(name: "Assasins Creed III", imageName: "ac03", year: 2012),
        Game(name: "Assasins Creed IV", imageName: "ac04", year: 2013),
        Game(name: "Assasins Creed Unity", imageName: "acUnity", year: 2014),
        Game(name: "Assasins Creed Syndicate", imageName: "acSyndicate", year: 2015),
        Game(name: "Assasins Creed Origins", imageName: "acOrigins", year: 2017),
        Game(name: "Assasins Creed Odyssey", imageName: "acOdyssey", year: 2018),
        Game(name: "Assasins Creed Valhalla", imageName: "acValhalla", year: 2020),
    ]
    
    var gamesCount: Int {
        games.count
    }
    
    func getGame(for index: Int) -> Game {
        games[index]
    }
    
}
