//
//  MenuRouter.swift
//  Halal guide
//
//  Created by Bagdat Zhunisbekov on 07.01.2021.
//  Copyright © 2021 Halaldamu. All rights reserved.
//

import Foundation
import UIKit

class MenuRouter: MenuRouterInput {
    
    private unowned let menuViewController: MenuViewController
    unowned let navigationController: NavigationController
    
    required init() {
        let viewController = MenuViewController()
        let navigationController = NavigationController(rootViewController: viewController)
        let presenter = MenuPresenter(view: viewController)
        let interactor = MenuInteractor(presenter: presenter)
        let menuIconImage = AppImage.menu_my_advice.uiImage?.fitted(in: CGSize(width: 16.0, height: 21.0))
        navigationController.tabBarItem = UITabBarItem(
            title: "Меню",
            image: menuIconImage,
            tag: 2
        )
        if #available(iOS 11.0, *) {
            navigationController.navigationBar.prefersLargeTitles = true
        }

        self.navigationController = navigationController
        menuViewController = viewController
        menuViewController.router = self
        menuViewController.interactor = interactor
    }
    
    func openFeedback() {
        let feedbackRouter = FeedbackRouter()
        feedbackRouter.openFeedback()
    }
}

extension MenuRouter: MainTabBarItemPageRouterInput {
    
    func reloadPage() {
        navigationController.tabBarItem.title = "Меню"
        menuViewController.title = "Меню"
        menuViewController.reloadPage()
    }
}

