//
//  AdditionDetailRouter.swift
//  Halal guide
//
//  Created by Ерасыл Турлыгажы on 01.10.2021.
//  Copyright © 2021 Halaldamu. All rights reserved.
//

import Foundation
import UIKit

class AdditionDetailRouter {
    
    init(navigationController: NavigationController, addition: Addition) {
        let storyboard = UIStoryboard(name: "Common", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "AdditionDetailViewController") as! AdditionDetailViewController
        viewController.setAddition(addition: addition)
        navigationController.pushViewController(viewController, animated: true)
        
    }
}
