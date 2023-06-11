//
//  RMCharacterInformationCollectionViewCellViewModel.swift
//  RickAndMorty
//
//  Created by Kristián Šmíd on 13.05.2023.
//

import UIKit

final class RMCharacterInformationCollectionViewCellViewModel {
    private let type: `Type`
    private let value: String
    
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        // 2017-11-04T18:48:46.250Z
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        formatter.timeZone = .current
        
        return formatter
    }()
    
    static let shortDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        formatter.timeZone = .current
        
        return formatter
    }()
    
    public var displayValue: String {
        if value.isEmpty { return "None" }
        
        // Self with capital S for static property
        if type == .created, let date = Self.dateFormatter.date(from: value) {
            return Self.shortDateFormatter.string(from: date)
        }
        
        return value
    }
    
    public var title: String {
        self.type.displayTitle
    }
    
    public var iconImage: UIImage? {
        self.type.iconImage
    }
    
    public var tintColor: UIColor {
        self.type.tintColor
    }
    
    enum `Type`: String {
        case status
        case gender
        case type
        case species
        case origin
        case location
        case created
        case episodeCount
        
        var displayTitle: String {
            switch self {
            case .status, .gender, .type, .species, .origin, .location, .created:
                return self.rawValue.capitalized
            case .episodeCount:
                return "Total episodes"
            }
        }
        
        var iconImage: UIImage? {
            switch self {
            case .status, .gender, .type, .species, .origin, .location, .created, .episodeCount:
                return UIImage(systemName: "bell")
            }
        }
        
        var tintColor: UIColor {
            switch self {
            case .status:
                return .systemRed
            case .gender:
                return .systemPink
            case .type:
                return .systemBlue
            case .species:
                return .systemOrange
            case .origin:
                return .systemBrown
            case .location:
                return .systemGreen
            case .created:
                return .systemCyan
            case .episodeCount:
                return .systemYellow
            }
        }
    }
    
    init(type: `Type`, value: String) {
        self.type = type
        self.value = value
    }
}
