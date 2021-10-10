//
//  ChooseCategoryViewController.swift
//  Halal guide
//
//  Created by Ерасыл Турлыгажы on 08.10.2021.
//  Copyright © 2021 Halaldamu. All rights reserved.
//

import UIKit

class ChooseCategoryViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var dataSource = [CheckboxWithLabel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = DataHolder.shared.getCategoryCheckboxes()
        self.title = "Выберите категорию"
    }
    
    @IBAction func switchChanged(_ sender: UISwitch) {
        dataSource[sender.tag].checked = sender.isOn
    }
    
    @IBAction func submitCategories(_ sender: Any) {
        DataHolder.shared.setCategoryCheckboxes(categoryCheckboxes: dataSource)
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func cancelChoosing(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func clearCategories(_ sender: Any) {
        dataSource.forEach {$0.checked = false}
        tableView.reloadData()
    }
}

extension ChooseCategoryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: SwitchAndLabelCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SwitchAndLabelCell
        let category = dataSource[indexPath.row]
        cell.label.text = category.text
        cell.uiSwitch.setOn(category.checked!, animated: true)
        cell.uiSwitch.tag = indexPath.row
        return cell
    }
    
    
}
