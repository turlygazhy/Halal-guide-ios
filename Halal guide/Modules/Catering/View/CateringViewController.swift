//
//  CateringViewController.swift
//  Halal guide
//
//  Created by Bagdat Zhunisbekov on 07.01.2021.
//  Copyright © 2021 Halaldamu. All rights reserved.
//

import Foundation
import UIKit

class CateringViewController: BaseViewController {
    
    var router: CateringRouterInput?
    var interactor: CateringInteractorInput?

    private let titleLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        
        titleLabel.text = "Питание"
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

extension CateringViewController: CateringViewInput {
    
}

extension CateringViewController: MainTabBarItemPageRouterInput {
    
    func reloadPage() {
        
    }
}
