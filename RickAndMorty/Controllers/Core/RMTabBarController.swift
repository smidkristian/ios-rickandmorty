//
//  ViewController.swift
//  RickAndMorty
//
//  Created by Kristián Šmíd on 10.04.2023.
//

import UIKit

final class RMTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTabs()
    }

    private func setUpTabs() {
        let charactersVC = RMCharacterViewController()
        let locationsVC = RMLocationViewController()
        let episodesVC = RMEpisodeViewController()
        let settingsVC = RMSettingsViewController()
        
        charactersVC.navigationItem.largeTitleDisplayMode = .automatic
        locationsVC.navigationItem.largeTitleDisplayMode = .automatic
        episodesVC.navigationItem.largeTitleDisplayMode = .automatic
        settingsVC.navigationItem.largeTitleDisplayMode = .automatic
        
        let charactersNav = UINavigationController(rootViewController: charactersVC)
        let locationsNav = UINavigationController(rootViewController: locationsVC)
        let episodesNav = UINavigationController(rootViewController: episodesVC)
        let settingsNav = UINavigationController(rootViewController: settingsVC)
        
        charactersNav.tabBarItem = UITabBarItem(title: "Characters", image: UIImage(systemName: "person"), tag: 1)
        locationsNav.tabBarItem = UITabBarItem(title: "Locations", image: UIImage(systemName: "globe"), tag: 2)
        episodesNav.tabBarItem = UITabBarItem(title: "Episodes", image: UIImage(systemName: "tv"), tag: 3)
        settingsNav.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gear"), tag: 4)
        
        for nav in [charactersNav, locationsNav, episodesNav, settingsNav] {
            nav.navigationBar.prefersLargeTitles = true
        }
        
        setViewControllers([charactersNav, locationsNav, episodesNav, settingsNav], animated: true)
    }

}

