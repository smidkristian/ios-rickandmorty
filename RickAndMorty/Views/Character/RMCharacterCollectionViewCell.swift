//
//  RMCharacterCollectionViewCell.swift
//  RickAndMorty
//
//  Created by Kristián Šmíd on 16.04.2027.
//

import UIKit

final class RMCharacterCollectionViewCell: UICollectionViewCell {
    static let cellIndetifier = "RMCharacterCollectionViewCell"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        
        // make only top corners rounded
        imageView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let statusLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .secondarySystemBackground
        contentView.addSubviews(imageView, nameLabel, statusLabel)
        addConstraints()
        setUpLayer()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }

    private func addConstraints() {
        NSLayoutConstraint.activate([
            statusLabel.heightAnchor.constraint(equalToConstant: 25),
            nameLabel.heightAnchor.constraint(equalToConstant: 30),
            
            statusLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 7.5),
            statusLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -7.5),
            nameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 7.5),
            nameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -7.5),
            
            statusLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            nameLabel.bottomAnchor.constraint(equalTo: statusLabel.topAnchor, constant: 5),
            
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            imageView.bottomAnchor.constraint(equalTo: nameLabel.topAnchor, constant: -5),
            imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor)
        ])
        
    }
    
    // when switching from light/dark mode we need to run the setUpLayer function
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        setUpLayer()
    }
    
    private func setUpLayer() {
        contentView.layer.cornerRadius = 8
        contentView.layer.shadowColor = UIColor.secondaryLabel.cgColor
        contentView.layer.shadowOffset = CGSize(width: 4, height: 4)
        contentView.layer.shadowOpacity = 0.2
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        nameLabel.text = nil
        statusLabel.text = nil
    }
    
    public func configure(with viewModel: RMCharacterCollectionViewCellViewModel) {
        nameLabel.text = viewModel.characterName
        statusLabel.text = viewModel.characterStatusText
        viewModel.fetchImage { [weak self] result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    let image = UIImage(data: data)
                    self?.imageView.image = image
                }
            case .failure(let error):
                print(String(describing: error))
                break
            }
        }
    }
}
