//
//  AdditionDetailViewController.swift
//  Halal guide
//
//  Created by Ерасыл Турлыгажы on 06.10.2021.
//  Copyright © 2021 Halaldamu. All rights reserved.
//

import UIKit

class AdditionDetailViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var addition: Addition?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    func setAddition(addition: Addition) {
        self.addition = addition
    }
    
    func setupViews(){
        titleLabel.text = addition?.name
        categoryLabel.text = addition?.category
        statusLabel.text = addition?.status?.name
//        statusLabel.textColor todo
        descriptionLabel.text = addition?.status_desc
    }
    //todo отображение детали не правильное, проблема как было в search detail
}
