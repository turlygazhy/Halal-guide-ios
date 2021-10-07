//
//  ChooseRegionViewController.swift
//  Halal guide
//
//  Created by Ерасыл Турлыгажы on 07.10.2021.
//  Copyright © 2021 Halaldamu. All rights reserved.
//

import UIKit

class ChooseRegionViewController: UIViewController {

    private var dataSource = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = DataHolder.shared.getRegionNames()
        self.title = "Выберите регион"
    }

}

extension ChooseRegionViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: RegionTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RegionTableViewCell
        cell.regionNameLabel.text = dataSource[indexPath.row]
        return cell
        //todo switch если кликнуть первую то она аффектнет и другую снизу
    }
    
    
    
}
