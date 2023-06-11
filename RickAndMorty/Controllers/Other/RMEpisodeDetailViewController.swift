//
//  RMEpisodeDetailViewController.swift
//  RickAndMorty
//
//  Created by Kristián Šmíd on 11.06.2023.
//

import UIKit

final class RMEpisodeDetailViewController: UIViewController {
    private let url: URL?
    
    init(url: URL?) {
        self.url = url
        
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
