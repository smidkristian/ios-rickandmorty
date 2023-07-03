//
//  RMSettingsOption.swift
//  RickAndMorty
//
//  Created by Kristián Šmíd on 03.07.2023.
//

import UIKit

enum RMSettingsOption: CaseIterable {
    case rating
    case contact
    case terms
    case privacy
    case apiReference
    case viewSeries
    case viewCode
    
    var displayTitle: String {
        switch self {
        case .rating:
            return "Rate App"
        case .contact:
            return "Contact Us"
        case .terms:
            return "Terms Of Service"
        case .privacy:
            return "Privacy Policy"
        case .apiReference:
            return "API Reference"
        case .viewSeries:
            return "View Video Series"
        case .viewCode:
            return "View App Code"
        }
    }
    
    var iconImage: UIImage? {
        switch self {
        case .rating:
            return UIImage(systemName: "star")
        case .contact:
            return UIImage(systemName: "paperplane")
        case .terms:
            return UIImage(systemName: "doc")
        case .privacy:
            return UIImage(systemName: "lock")
        case .apiReference:
            return UIImage(systemName: "list.clipboard")
        case .viewSeries:
            return UIImage(systemName: "tv")
        case .viewCode:
            return UIImage(systemName: "hammer")
        }
    }
}
