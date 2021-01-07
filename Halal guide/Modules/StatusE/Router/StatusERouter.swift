//
//  StatusERouter.swift
//  Halal guide
//
//  Created by Bagdat Zhunisbekov on 07.01.2021.
//  Copyright © 2021 Halaldamu. All rights reserved.
//

import Foundation
import UIKit

class StatusERouter: StatusERouterInput {
    
    private unowned let statusEViewController: StatusEViewController
    unowned let navigationController: NavigationController
    
    required init() {
        let viewController = StatusEViewController()
        let navigationController = NavigationController(rootViewController: viewController)
        let presenter = StatusEPresenter(view: viewController)
        let interactor = StatusEInteractor(presenter: presenter)
        let menuIconImage = AppImage.menu_my_advice.uiImage?.fitted(in: CGSize(width: 16.0, height: 21.0))
        navigationController.tabBarItem = UITabBarItem(
            title: "Добавки Е",
            image: menuIconImage,
            tag: 2
        )
        if #available(iOS 11.0, *) {
            navigationController.navigationBar.prefersLargeTitles = true
        }

        self.navigationController = navigationController
        statusEViewController = viewController
        statusEViewController.router = self
        statusEViewController.interactor = interactor
    }
}

extension StatusERouter: MainTabBarItemPageRouterInput {
    
    func reloadPage() {
        navigationController.tabBarItem.title = "Добавки Е"
        statusEViewController.title = "Добавки Е"
        statusEViewController.reloadPage()
    }
}
