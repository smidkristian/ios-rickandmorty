//
//  RMEndpoint.swift
//  RickAndMorty
//
//  Created by Kristián Šmíd on 10.04.2023.
//

import Foundation

@frozen enum RMEndpoint: String, CaseIterable, Hashable {
    case character
    case location
    case episode
}
