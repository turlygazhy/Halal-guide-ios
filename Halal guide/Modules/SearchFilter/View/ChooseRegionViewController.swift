//
//  ChooseRegionViewController.swift
//  Halal guide
//
//  Created by Ерасыл Турлыгажы on 07.10.2021.
//  Copyright © 2021 Halaldamu. All rights reserved.
//

import UIKit

class ChooseRegionViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var dataSource = [CheckboxWithLabel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = DataHolder.shared.getRegionCheckboxes()
        self.title = "Выберите регион"
    }
    
    @IBAction func switchChanged(_ sender: UISwitch) {
        dataSource[sender.tag].checked = sender.isOn
    }
    
    @IBAction func submitRegions(_ sender: Any) {
        DataHolder.shared.setRegionCheckboxes(regionCheckboxes: dataSource)
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func cancelChoosing(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func clearRegions(_ sender: Any) {
        dataSource.forEach {$0.checked = false}
        tableView.reloadData()
    }
    
}

extension ChooseRegionViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: SwitchAndLabelCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SwitchAndLabelCell
        let region = dataSource[indexPath.row]
        cell.label.text = region.text
        cell.uiSwitch.setOn(region.checked!, animated: true)
        cell.uiSwitch.tag = indexPath.row
        return cell
    }
    
}
