//
//  FeedbackViewController.swift
//  Halal guide
//
//  Created by Ерасыл Турлыгажы on 23.07.2021.
//  Copyright © 2021 Halaldamu. All rights reserved.
//

import UIKit

class FeedbackViewController: BaseViewController {

    var router: FeedbackRouterInput?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        self.title = "Обратная связь"
    }
    
    private func setConstraints() {
        
    }
}

extension FeedbackViewController: FeedbackViewInput {
    
}
