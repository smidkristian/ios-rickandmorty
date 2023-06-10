//
//  RMCharacterInformationCollectionViewCell.swift
//  RickAndMorty
//
//  Created by Kristián Šmíd on 13.05.2023.
//

import UIKit

final class RMCharacterInformationCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "RMCharacterInformationCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    private func setupConstraints() {
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    public func configure(with viewModel: RMCharacterInformationCollectionViewCellViewModel){
        
    }
}
