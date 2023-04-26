//
//  RMCharacterList.swift
//  RickAndMorty
//
//  Created by Kristián Šmíd on 12.04.2023.
//

import Foundation

struct RMGetAllCharactersResponse: Codable {
    struct Info: Codable {
        let count: Int
        let pages: Int
        let next: String?
        let prev: String?
    }
    
    let info: Info
    let results: [RMCharacter]
}

