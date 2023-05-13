//
//  RMCharacterViewController.swift
//  RickAndMorty
//
//  Created by Kristián Šmíd on 10.04.2023.
//

import UIKit

final class RMCharacterViewController: UIViewController, RMCharactersListViewDelegate {
    
    private let charactersListView = RMCharactersListView()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        title = "Characters"
        setUpView()
    }
    
    private func setUpView() {
        charactersListView.delegate = self
        view.addSubview(charactersListView)
        
        NSLayoutConstraint.activate([
            charactersListView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            charactersListView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            charactersListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            charactersListView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor)
        ])
    }
    
    // MARK: - RMCharacterListViewDelegate
    
    func rmCharactersListView(_ characterListView: RMCharactersListView,
                              didSelectCharacter character: RMCharacter) {
        let viewModel = RMCharacterDetailViewViewModel(character: character)
        let detailVC = RMCharacterDetailViewController(viewModel: viewModel)
        
        detailVC.navigationItem.largeTitleDisplayMode = .never
        
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
