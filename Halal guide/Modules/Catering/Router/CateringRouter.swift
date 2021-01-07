//
//  CateringRouter.swift
//  Halal guide
//
//  Created by Bagdat Zhunisbekov on 07.01.2021.
//  Copyright © 2021 Halaldamu. All rights reserved.
//

import Foundation
import UIKit

class CateringRouter: CateringRouterInput {
    
    private unowned let cateringViewController: CateringViewController
    unowned let navigationController: NavigationController
    
    required init() {
        let viewController = CateringViewController()
        let navigationController = NavigationController(rootViewController: viewController)
        let presenter = CateringPresenter(view: viewController)
        let interactor = CateringInteractor(presenter: presenter)
        let menuIconImage = AppImage.menu_my_advice.uiImage?.fitted(in: CGSize(width: 16.0, height: 21.0))
        navigationController.tabBarItem = UITabBarItem(
            title: "Питание",
            image: menuIconImage,
            tag: 2
        )
        if #available(iOS 11.0, *) {
            navigationController.navigationBar.prefersLargeTitles = true
        }

        self.navigationController = navigationController
        cateringViewController = viewController
        cateringViewController.router = self
        cateringViewController.interactor = interactor
    }
}

extension CateringRouter: MainTabBarItemPageRouterInput {
    
    func reloadPage() {
        navigationController.tabBarItem.title = "Общественное питание"
        cateringViewController.title = "Общественное питание"
        cateringViewController.reloadPage()
    }
}
