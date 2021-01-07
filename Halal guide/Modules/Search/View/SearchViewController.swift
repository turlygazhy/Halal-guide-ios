//
//  SearchViewController.swift
//  Halal guide
//
//  Created by Bagdat Zhunisbekov on 07.01.2021.
//  Copyright © 2021 Halaldamu. All rights reserved.
//

import Foundation
import UIKit

class SearchViewController: BaseViewController {
    
    var router: SearchRouterInput?
    var interactor: SearchInteractorInput?

    private let titleLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        
        titleLabel.text = "Поиск"
        view.addSubview(titleLabel)
    }
    
    private func setConstraints() {
        var layoutConstraints = [NSLayoutConstraint]()

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        layoutConstraints += [
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]

        NSLayoutConstraint.activate(layoutConstraints)
    }
}

extension SearchViewController: SearchViewInput {
    
}

extension SearchViewController: MainTabBarItemPageRouterInput {
    
    func reloadPage() {
        
    }
}
