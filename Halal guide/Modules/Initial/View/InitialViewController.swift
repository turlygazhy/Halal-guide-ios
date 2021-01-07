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
    
    private let logoImageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
    
        setupViews()
        setConstraints()
        
        interactor?.routeToMainPage()
    }
    
    private func setupViews() {
        view.backgroundColor = AppColor.green.uiColor
    
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.image = AppImage.appLogo.uiImage
        view.addSubview(logoImageView)
    }
 
    private func setConstraints() {
        var layoutConstraints = [NSLayoutConstraint]()

        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        layoutConstraints += [
            logoImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 200.0),
            logoImageView.heightAnchor.constraint(equalToConstant: 200.0)
        ]

        NSLayoutConstraint.activate(layoutConstraints)
    }
}

extension InitialViewController: InitialViewInput {
    
    func routeToMainPage() {
        router?.routeToMainPage()
    }
}
