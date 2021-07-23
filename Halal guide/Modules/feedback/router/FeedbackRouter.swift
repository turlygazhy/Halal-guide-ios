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
    unowned let navigationController: NavigationController

    init() {
        let viewController = FeedbackViewController()
        self.feedbackViewController = viewController
        
        let navigationController = NavigationController(rootViewController: feedbackViewController)
        self.navigationController = navigationController
    }
    
    func openFeedback() {
        self.navigationController.pushViewController(feedbackViewController, animated: true)
    }

}
