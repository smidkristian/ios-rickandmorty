//
//  RMCharacterInformationCollectionViewCellViewModel.swift
//  RickAndMorty
//
//  Created by Kristián Šmíd on 13.05.2023.
//

import Foundation

final class RMCharacterInformationCollectionViewCellViewModel {
    public let value: String
    public let title: String
    
    init(value: String, title: String) {
        self.value = value
        self.title = value
    }
}
