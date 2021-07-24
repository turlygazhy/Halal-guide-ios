//
//  FeedbackRouter.swift
//  Halal guide
//
//  Created by Ерасыл Турлыгажы on 23.07.2021.
//  Copyright © 2021 Halaldamu. All rights reserved.
//

import Foundation
import UIKit

class FeedbackRouter: FeedbackRouterInput {
    
    private unowned let feedbackViewController: FeedbackViewController
    private unowned let navigationController: NavigationController

    init(navigationController: NavigationController) {
        self.navigationController = navigationController

        let viewController = FeedbackViewController()
        self.feedbackViewController = viewController
        viewController.router = self

        navigationController.pushViewController(viewController, animated: true)
    }
    
}
