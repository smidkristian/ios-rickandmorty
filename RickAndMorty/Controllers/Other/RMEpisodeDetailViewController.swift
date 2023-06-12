//
//  RMEpisodeDetailViewController.swift
//  RickAndMorty
//
//  Created by Kristián Šmíd on 11.06.2023.
//

import UIKit

final class RMEpisodeDetailViewController: UIViewController {
    private let viewModel: RMEpisodeDetailViewViewModel
    
    init(url: URL?) {
        self.viewModel = .init(endpointUrl: url)
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Episode"
        view.backgroundColor = .tertiarySystemBackground
    }

}
