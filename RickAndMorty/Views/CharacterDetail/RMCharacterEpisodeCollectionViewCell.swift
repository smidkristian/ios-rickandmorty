//
//  RMCharacterEpisodeCollectionViewCell.swift
//  RickAndMorty
//
//  Created by Kristián Šmíd on 13.05.2023.
//

import UIKit

final class RMCharacterEpisodeCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "RMCharacterEpisodeCollectionViewCell"
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        return label
    }()
    
    private let seasonLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20, weight: .regular)
        return label
    }()
    
    private let airDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .light)
        return label
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .tertiarySystemBackground
        contentView.layer.cornerRadius = 12
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.systemBlue.cgColor
        contentView.addSubviews(nameLabel, seasonLabel, airDateLabel)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.25),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            nameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            nameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            
            seasonLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            seasonLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            seasonLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            
            airDateLabel.topAnchor.constraint(equalTo: seasonLabel.bottomAnchor),
            airDateLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            airDateLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            airDateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabel.text = nil
        seasonLabel.text = nil
        airDateLabel.text = nil
    }
    
    public func configure(with viewModel: RMCharacterEpisodeCollectionViewCellViewModel){
        viewModel.registerForData { [weak self] data in
            self?.nameLabel.text = data.name
            self?.seasonLabel.text = "Episode: " + data.episode
            self?.airDateLabel.text = "Aired on: " + data.air_date
        }
        viewModel.fetchEpisode()
    }
}
