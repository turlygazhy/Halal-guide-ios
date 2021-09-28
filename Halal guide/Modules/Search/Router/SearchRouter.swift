//
//  SearchRouter.swift
//  Halal guide
//
//  Created by Bagdat Zhunisbekov on 07.01.2021.
//  Copyright © 2021 Halaldamu. All rights reserved.
//

import Foundation
import UIKit

class SearchRouter: SearchRouterInput {
    
    private unowned let searchViewController: SearchViewController
    unowned let navigationController: NavigationController
    
    required init() {
        let viewController = SearchViewController()
        let navigationController = NavigationController(rootViewController: viewController)
        let networkService = NetworkAdapter(sessionManager: sessionManager)
        let presenter = SearchPresenter(view: viewController)
        let interactor = SearchInteractor(networkService: networkService, presenter: presenter)
        let menuIconImage = AppImage.menu_search.uiImage?.fitted(in: CGSize(width: 16.0, height: 21.0))
        navigationController.tabBarItem = UITabBarItem(
            title: "Поиск",
            image: menuIconImage,
            tag: 2
        )
        if #available(iOS 11.0, *) {
            navigationController.navigationBar.prefersLargeTitles = true
        }

        self.navigationController = navigationController
        searchViewController = viewController
        searchViewController.router = self
        searchViewController.interactor = interactor
    }
    
    func openDetail(place: Place) {
        _ = SearchDetailRouter(navigationController: navigationController, place: place)
    }
}

extension SearchRouter: MainTabBarItemPageRouterInput {
    
    func reloadPage() {
        navigationController.tabBarItem.title = "Поиск"
        searchViewController.title = "Поиск"
        searchViewController.reloadPage()
    }
}
