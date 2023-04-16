//
//  Extensions.swift
//  RickAndMorty
//
//  Created by Kristián Šmíd on 16.04.2023.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach({
            addSubview($0)
        })
    }
}
