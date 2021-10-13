//
//  MenuViewController.swift
//  Halal guide
//
//  Created by Bagdat Zhunisbekov on 07.01.2021.
//  Copyright © 2021 Halaldamu. All rights reserved.
//

import Foundation
import UIKit

class MenuViewController: BaseViewController {
    
    var router: MenuRouterInput?
    var interactor: MenuInteractorInput?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = "Меню"
        //todo menu is ugly
    }
    
    @IBAction func markApp(_ sender: Any) {
        //todo
    }
    
    @IBAction func shareApp(_ sender: Any) {
        //todo
    }
    
}

extension MenuViewController: MenuViewInput {
    func reloadPage() {
        
    }
}
