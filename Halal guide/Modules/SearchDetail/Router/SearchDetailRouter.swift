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
        let storyboard = UIStoryboard(name: "Common", bundle: nil)
        self.navigationController = navigationController
        let viewController = storyboard.instantiateViewController(withIdentifier: "SearchDetailViewController") as! SearchDetailViewController
        viewController.setPlace(place: place)
        self.searchDetailViewController = viewController
        navigationController.pushViewController(viewController, animated: true)
    }
}
