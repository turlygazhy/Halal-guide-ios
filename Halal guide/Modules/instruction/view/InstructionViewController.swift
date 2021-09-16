//
//  InstructionViewController.swift
//  Halal guide
//
//  Created by Ерасыл Турлыгажы on 25.07.2021.
//  Copyright © 2021 Halaldamu. All rights reserved.
//

import Foundation
import UIKit

class InstructionViewController: BaseViewController {
    
    var router: InstructionRouterInput?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        self.title = MenuItem.instruction.description
    }
    
    private func setConstraints() {
        
    }
}

extension InstructionViewController: InstructionViewInput {
    
}
