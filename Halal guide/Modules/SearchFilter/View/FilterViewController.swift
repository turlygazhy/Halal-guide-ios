//
//  FilterViewController.swift
//  Halal guide
//
//  Created by Ерасыл Турлыгажы on 01.10.2021.
//  Copyright © 2021 Halaldamu. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController {
    
    @IBOutlet weak var chooseRegionButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chooseRegionButton.setTitleColor(.black, for: .normal)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let regionCheckboxes = DataHolder.shared.getRegionCheckboxes()
        let chosen = regionCheckboxes.map{$0.checked! ? $0.text! : ""}.filter{!$0.isEmpty}.joined(separator: ", ")
        chosen.isEmpty ? chooseRegionButton.setTitle("Выберите регион", for: .normal) : chooseRegionButton.setTitle(chosen, for: .normal)
    }
}
