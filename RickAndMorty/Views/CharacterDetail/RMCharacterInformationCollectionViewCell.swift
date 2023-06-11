//
//  RMCharacterInformationCollectionViewCell.swift
//  RickAndMorty
//
//  Created by Kristián Šmíd on 13.05.2023.
//

import UIKit

final class RMCharacterInformationCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "RMCharacterInformationCollectionViewCell"
    
    private let valueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Earth"
        label.font = .systemFont(ofSize: 18)
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Location"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .medium)
        return label
    }()
    
    private let iconImageView: UIImageView = {
        let icon = UIImageView()
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.image = UIImage(systemName: "globe.americas")
        icon.contentMode = .scaleAspectFit
        return icon
    }()
    
    private let titleContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .secondarySystemBackground
        return view
    }()
    
    // MARK - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .tertiarySystemBackground
        contentView.layer.cornerRadius = 12
        contentView.layer.masksToBounds = true
        contentView.addSubviews(valueLabel, titleContainerView, iconImageView)
        titleContainerView.addSubview(titleLabel)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleContainerView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            titleContainerView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            titleContainerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            titleContainerView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.33),
            
            titleLabel.topAnchor.constraint(equalTo: titleContainerView.topAnchor),
            titleLabel.rightAnchor.constraint(equalTo: titleContainerView.rightAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: titleContainerView.bottomAnchor),
            titleLabel.leftAnchor.constraint(equalTo: titleContainerView.leftAnchor),
            
            iconImageView.heightAnchor.constraint(equalToConstant: 40),
            iconImageView.widthAnchor.constraint(equalToConstant: 40),
            iconImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            iconImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            
            valueLabel.heightAnchor.constraint(equalToConstant: 40),
            valueLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            valueLabel.leftAnchor.constraint(equalTo: iconImageView.rightAnchor, constant: 10),
            valueLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 10),
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        valueLabel.text = nil
        titleLabel.text = nil
        iconImageView.image = nil
    }
    
    public func configure(with viewModel: RMCharacterInformationCollectionViewCellViewModel){
        
    }
}
