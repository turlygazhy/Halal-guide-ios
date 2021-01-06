//
//  InitialRouter.swift
//  Halal guide
//
//  Created by Bagdat Zhunisbekov on 06.01.2021.
//  Copyright © 2021 Halaldamu. All rights reserved.
//

import UIKit
import Foundation

class InitialRouter: InitialRouterInput {
        
    private weak var viewController: InitialViewController?

    func createModule() -> UIViewController {
        let viewController = InitialViewController()
        self.viewController = viewController

        let presenter = InitialPresenter(view: viewController)
        let interactor = InitialInteractor(presenter: presenter)

        viewController.interactor = interactor
        viewController.router = self

        return viewController
    }

    func routeToMainPage() {
        // call router of main page
    }
}
