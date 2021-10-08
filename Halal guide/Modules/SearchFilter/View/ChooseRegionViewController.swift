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
    
    private var dataSource = [RegionCheckbox]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = DataHolder.shared.getRegionCheckboxes()
        self.title = "Выберите регион"
        //todo bug
        //when i open choose region first time and click any, click cancel, and back I see that my chose was saved.
        //i think i dont have two vars, both is link to one
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
        let cell: RegionTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RegionTableViewCell
        let region = dataSource[indexPath.row]
        cell.regionNameLabel.text = region.text
        cell.regionSwitch.setOn(region.checked!, animated: true)
        cell.regionSwitch.tag = indexPath.row
        return cell
    }
    
}
