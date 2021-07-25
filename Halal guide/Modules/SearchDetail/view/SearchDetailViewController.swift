//
//  SearchDetailViewController.swift
//  Halal guide
//
//  Created by Ерасыл Турлыгажы on 25.07.2021.
//  Copyright © 2021 Halaldamu. All rights reserved.
//

import Foundation
import UIKit

class SearchDetailViewController: BaseViewController {
    
    var router: SearchDetailRouterInput?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        self.title = "todo what should be here"
    }
    
    private func setConstraints() {
        
    }
}

extension SearchDetailViewController: SearchDetailViewInput {
    
}
