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
    @IBOutlet weak var chooseCategoryButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chooseRegionButton.setTitleColor(.black, for: .normal)
        chooseCategoryButton.setTitleColor(.black, for: .normal)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let regionCheckboxes = DataHolder.shared.getRegionCheckboxes()
        let chosenRegions = regionCheckboxes.map{$0.checked! ? $0.text! : ""}.filter{!$0.isEmpty}.joined(separator: ", ")
        chosenRegions.isEmpty ? chooseRegionButton.setTitle("Выберите регион", for: .normal) : chooseRegionButton.setTitle(chosenRegions, for: .normal)
    
        let categoryCheckboxes = DataHolder.shared.getCategoryCheckboxes()
        let chosenCategories = categoryCheckboxes.map{$0.checked! ? $0.text! : ""}.filter{!$0.isEmpty}.joined(separator: ", ")
        chosenCategories.isEmpty ? chooseCategoryButton.setTitle("Выберите категорию", for: .normal) : chooseCategoryButton.setTitle(chosenCategories, for: .normal)
    }
}
