//
//  InstructionRouter.swift
//  Halal guide
//
//  Created by Ерасыл Турлыгажы on 24.07.2021.
//  Copyright © 2021 Halaldamu. All rights reserved.
//

import Foundation
import UIKit

class InstructionRouter: InstructionRouterInput {
    
    private unowned let instructionViewController: InstructionViewController
    private unowned let navigationController: NavigationController
    
    init(navigationController: NavigationController) {
        self.navigationController = navigationController
        
        let viewController = InstructionViewController()
        self.instructionViewController = viewController
        viewController.router = self
        
        navigationController.pushViewController(viewController, animated: true)
    }
}
