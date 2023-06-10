//
//  CharactersListView.swift
//  RickAndMorty
//
//  Created by Kristián Šmíd on 12.04.2023.
//

import UIKit

protocol RMCharactersListViewDelegate: AnyObject {
    func rmCharactersListView(_ characterListView: RMCharactersListView, didSelectCharacter character: RMCharacter)
}

final class RMCharactersListView: UIView {
    
    public weak var delegate: RMCharactersListViewDelegate?
    
    private let viewModel = RMCharactersListViewViewModel()
    
    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.hidesWhenStopped = true
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 10)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isHidden = true
        collectionView.alpha = 0
        
        collectionView.register(RMCharacterCollectionViewCell.self, forCellWithReuseIdentifier: RMCharacterCollectionViewCell.cellIndetifier)
        
        collectionView.register(RMFooterLoadingCollectionReusableView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
                                withReuseIdentifier: RMFooterLoadingCollectionReusableView.identifier)
        
        return collectionView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        addSubviews(collectionView, spinner)
        addConstraints()
        
        spinner.startAnimating()
        
        viewModel.delegate = self
        
        viewModel.fetchCharacters()
        setUpCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            spinner.widthAnchor.constraint(equalToConstant: 100),
            spinner.heightAnchor.constraint(equalToConstant: 100),
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor),
        
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor)
        ])
    }
    
    private func setUpCollectionView() {
        collectionView.dataSource = viewModel
        collectionView.delegate = viewModel
        
    }
}

extension RMCharactersListView: RMCharactersListViewViewModelDelegate {
    func didSelectCharacter(_ character: RMCharacter) {
        delegate?.rmCharactersListView(self, didSelectCharacter: character)
    }
    
    func didLoadInitialCharacters() {
        spinner.stopAnimating()
        collectionView.isHidden = false
        
        collectionView.reloadData() // initial fetch only
        
        UIView.animate(withDuration: 0.4) {
            self.collectionView.alpha = 1
        }
    }
    
    func didLoadMoreCharacters(with newIndexPaths: [IndexPath]) {
        collectionView.performBatchUpdates {
            self.collectionView.insertItems(at: newIndexPaths)
        }
    }
}
