//
//  SearchDetailRouter.swift
//  Halal guide
//
//  Created by Ерасыл Турлыгажы on 25.07.2021.
//  Copyright © 2021 Halaldamu. All rights reserved.
//

import Foundation
import UIKit

class SearchDetailRouter: SearchDetailRouterInput {
    
    private unowned let searchDetailViewController: SearchDetailViewController
    private unowned let navigationController: NavigationController
    
    init(navigationController: NavigationController, place: Place) {
        self.navigationController = navigationController
        
        let viewController = SearchDetailViewController(place: place)
        self.searchDetailViewController = viewController
        viewController.router = self
        
        navigationController.pushViewController(viewController, animated: true)
    }
}
