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
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate,
              let window = appDelegate.window else {
            fatalError("Can't reach AppDelegate")
        }
        let mainTabBarRouter = MainRouter()
        let tabViewController = mainTabBarRouter.createModule()
        
        UIView.transition(
                with: window,
                duration: 0.3,
                options: .transitionCrossDissolve,
                animations: { window.rootViewController = tabViewController },
                completion: nil
        )
    }
}
