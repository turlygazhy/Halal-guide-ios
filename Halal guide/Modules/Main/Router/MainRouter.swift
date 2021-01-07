//
//  MainRouter.swift
//  Halal guide
//
//  Created by Bagdat Zhunisbekov on 07.01.2021.
//  Copyright © 2021 Halaldamu. All rights reserved.
//

import Foundation
import UIKit

class MainRouter: MainRouterInput {
    
    unowned var navigationController: NavigationController?
    unowned var mainTabBarController: MainViewController?

    var pageRouters: [MainTabBarItemPageRouterInput] = []

    func createModule() -> UIViewController {
        let searchRouter = SearchRouter()
        let menuRouter = MenuRouter()
        let cateringRouter = CateringRouter()
        let statusERouter = StatusERouter()
        
        let mainTabBarController = MainViewController()
        self.mainTabBarController = mainTabBarController
        mainTabBarController.modalPresentationStyle = .overFullScreen

        let navigationController = NavigationController(rootViewController: mainTabBarController)

        self.navigationController = navigationController

        mainTabBarController.viewControllers = [
            searchRouter.navigationController,
            cateringRouter.navigationController,
            statusERouter.navigationController,
            menuRouter.navigationController
        ]
                
        pageRouters = [
            searchRouter,
            cateringRouter,
            statusERouter,
            menuRouter
        ]
        
        mainTabBarController.router = self
        
        return mainTabBarController
    }
}
