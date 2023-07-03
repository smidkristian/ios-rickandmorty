//
//  RMSettingsView.swift
//  RickAndMorty
//
//  Created by Kristián Šmíd on 03.07.2023.
//

import SwiftUI

struct RMSettingsView: View {
    private let viewModel: RMSettingsViewViewModel
        
    init(viewModel: RMSettingsViewViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        List(viewModel.cellViewModels) { viewModel in
            HStack {
                if let image = viewModel.image {
                    Image(uiImage: image)
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(.accentColor)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20)
                }
                Text(viewModel.title)
                    .padding(10)
                Spacer()
            }
            .contentShape(Rectangle())
            .onTapGesture {
                viewModel.onTapHandler(viewModel.type)
            }
        }
    }
}

struct RMSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        RMSettingsView(viewModel: .init(cellViewModels: RMSettingsOption.allCases.compactMap({
            return RMSettingsCellViewModel(type: $0) { option in
                print(option.displayTitle)
            }
        })))
    }
}
