//
//  ViewController.swift
//  Halal guide
//
//  Created by user on 1/2/21.
//  Copyright © 2021 Halaldamu. All rights reserved.
//

import UIKit

class InitialViewController: BaseViewController {

    var router: InitialRouterInput?
    var interactor: InitialInteractorInput?
    
    private let titleLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
    
        setupViews()
        setConstraints()
        
        interactor?.routeToMainPage()
    }
    
    private func setupViews() {
        view.backgroundColor = .white
    
        titleLabel.text = "Welcome to Initial Page"
        view.addSubview(titleLabel)
    }
 
    private func setConstraints() {
        var layoutConstraints = [NSLayoutConstraint]()

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        layoutConstraints += [
            titleLabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        ]

        NSLayoutConstraint.activate(layoutConstraints)
    }
}

extension InitialViewController: InitialViewInput {
    
    func routeToMainPage() {
        router?.routeToMainPage()
    }
}
