//
//  RMCharacterViewController.swift
//  RickAndMorty
//
//  Created by Kristián Šmíd on 10.04.2023.
//

import UIKit

final class RMCharacterViewController: UIViewController {
    
    private let charactersListView = RMCharactersListView()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        title = "Characters"
        setUpView()
    }
    
    private func setUpView() {
        view.addSubview(charactersListView)
        
        NSLayoutConstraint.activate([
            charactersListView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            charactersListView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            charactersListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            charactersListView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor)
        ])
    }
}
