//
//  MenuViewController.swift
//  Halal guide
//
//  Created by Bagdat Zhunisbekov on 07.01.2021.
//  Copyright © 2021 Halaldamu. All rights reserved.
//

import Foundation
import UIKit

class MenuViewController: BaseViewController {
    
    var router: MenuRouterInput?
    var interactor: MenuInteractorInput?

    private let titleLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        
        titleLabel.text = "Меню"
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

extension MenuViewController: MenuViewInput {
    
}

extension MenuViewController: MainTabBarItemPageRouterInput {
    
    func reloadPage() {
        
    }
}
