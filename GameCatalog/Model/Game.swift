//
//  Game.swift
//  GameCatalog
//
//  Created by Mochamad Dandi on 02/09/21.
//

import Foundation

struct Games: Codable {
    
    let results : [Game]
    
    enum CodingKeys:  String, CodingKey {
        case results
    }
}



struct Game : Codable, Identifiable {
    let id = UUID()
    let gameId: Int
    let name : String
    let released : String
    let backgroundImage : String
    let rating : Double
    let platforms: [PlatformElement]
    
    enum CodingKeys : String , CodingKey {
        case gameId = "id"
        case name
        case released
        case backgroundImage = "background_image"
        case rating
        case platforms
    }
}

struct SearchedGames: Codable {

    let searchedGames: [SearchedGame]

    enum CodingKeys: String, CodingKey {
        case searchedGames = "results"

    }
}

struct SearchedGame: Codable, Identifiable {
    let id = UUID()
    let gameId : Int
    let name: String
    let released: String?
    let backgroundImage: String?
    let rating: Double
    
    enum CodingKeys: String, CodingKey {
        case gameId = "id"
        case name, released
        case backgroundImage = "background_image"
        case rating
    }
    
}

struct PlatformElement: Codable {
    let releasedAt: String?
    let requirementsEn, requirementsRu: Requirements?
    let platform : Platform

    enum CodingKeys: String, CodingKey {
        case releasedAt = "released_at"
        case requirementsEn = "requirements_en"
        case requirementsRu = "requirements_ru"
        case platform
    }
}

struct Requirements: Codable {
    let minimum: String?
    
    enum CodingKeys: String, CodingKey {
        case minimum
    }
}

struct Platform: Codable {
    let name : String
    
    enum CodingKeys: String, CodingKey {
        case name
    }
}
