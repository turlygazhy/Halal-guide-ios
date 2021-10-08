//
//  ChooseRegionViewController.swift
//  Halal guide
//
//  Created by Ерасыл Турлыгажы on 07.10.2021.
//  Copyright © 2021 Halaldamu. All rights reserved.
//

import UIKit

class ChooseRegionViewController: UIViewController {

    private var dataSource = [RegionCheckbox]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = DataHolder.shared.getRegionNames().map{RegionCheckbox(checked: false, text: $0)}
        self.title = "Выберите регион"
    }

    @IBAction func switchChanged(_ sender: UISwitch) {
        dataSource[sender.tag].checked = sender.isOn
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
        cell.regionSwitch.setOn(region.checked!, animated: false)
        cell.regionSwitch.tag = indexPath.row
        return cell
        //todo switch если кликнуть первую то она аффектнет и другую снизу
    }
    
    
    
}
