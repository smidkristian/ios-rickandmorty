//
//  RMSettingsCellViewModel.swift
//  RickAndMorty
//
//  Created by Kristián Šmíd on 03.07.2023.
//

import Foundation
import UIKit

struct RMSettingsCellViewModel: Identifiable, Hashable {
    let id = UUID()
    
    public var image: UIImage? {
        return type.iconImage
    }
    public var title: String {
        return type.displayTitle
    }
    
    private let type: RMSettingsOption
    
    init(type: RMSettingsOption) {
        self.type = type
    }
}
