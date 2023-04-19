//
//  RMCharacterDetailViewViewModel.swift
//  RickAndMorty
//
//  Created by Kristián Šmíd on 19.04.2023.
//

import UIKit

class RMCharacterDetailViewViewModel {
    private let character: RMCharacter

    init(character: RMCharacter) {
        self.character = character
    }
    
    public var title: String {
        character.name
    }
}
