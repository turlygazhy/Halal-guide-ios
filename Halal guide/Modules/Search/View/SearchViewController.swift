//
//  SearchViewController.swift
//  Halal guide
//
//  Created by Bagdat Zhunisbekov on 07.01.2021.
//  Copyright © 2021 Halaldamu. All rights reserved.
//

import Foundation
import UIKit

class SearchViewController: BaseViewController {
    
    var router: SearchRouterInput?
    var interactor: SearchInteractorInput?

    private var dataSource = [Place]()

    private let tableView = UITableView(frame: .zero, style: .grouped)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
        
        interactor?.getPlaces()
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        
        title = "Поиск"
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(SearchViewCell.self)
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorColor = AppColor.seperator.uiColor
        tableView.backgroundColor = .white
        tableView.tableFooterView = UIView()
        tableView.estimatedRowHeight = 60
        tableView.sectionHeaderHeight = UITableView.automaticDimension
        tableView.rowHeight = UITableView.automaticDimension
        view.addSubview(tableView)
    }
    
    private func setConstraints() {
        var layoutConstraints = [NSLayoutConstraint]()

        tableView.translatesAutoresizingMaskIntoConstraints = false
        layoutConstraints += [
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]

        NSLayoutConstraint.activate(layoutConstraints)
    }
}

extension SearchViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension SearchViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: SearchViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        cell.set(place: dataSource[indexPath.row])
        return cell
    }
}

extension SearchViewController: SearchViewInput {
    
    func setData(places: [Place]) {
        dataSource = places
        tableView.reloadData()
    }
}

extension SearchViewController: MainTabBarItemPageRouterInput {
    
    func reloadPage() {
        
    }
}
