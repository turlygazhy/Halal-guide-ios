//
//  StatusEViewController.swift
//  Halal guide
//
//  Created by Bagdat Zhunisbekov on 07.01.2021.
//  Copyright © 2021 Halaldamu. All rights reserved.
//

import Foundation
import UIKit

class StatusEViewController: BaseViewController {
    
    var router: StatusERouterInput?
    var interactor: StatusEInteractorInput?
    
    private var dataSource = [Addition]()
    
    var searchBar: UISearchBar?
    
    private let tableView = UITableView(frame: .zero, style: .grouped)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: self.view.frame.width - 30, height: 20))
        searchBar!.placeholder = "Номер добавки, название"
        searchBar!.delegate = self
        let searchButton = UIBarButtonItem(customView: searchBar!)
        navigationItem.leftBarButtonItem = searchButton
        
        setupViews()
        setConstraints()
        
        interactor?.getAdditions()
        
        tableView.keyboardDismissMode = .onDrag
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
    }
    
    @objc func hideKeyboard() {
        self.searchBar?.endEditing(true)
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        
        title = "Добавки Е"
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(StatusEViewCell.self)
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

extension StatusEViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        router?.openDetail(addition: dataSource[indexPath.row])
    }
}

extension StatusEViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: StatusEViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        cell.set(addition: dataSource[indexPath.row])
        return cell
    }
}

extension StatusEViewController: StatusEViewInput {
    
    func setData(additions: [Addition]) {
        dataSource = additions
        DataHolder.shared.setAdditions(additions: additions)
        tableView.reloadData()
    }
}

extension StatusEViewController: MainTabBarItemPageRouterInput {
    
    func reloadPage() {
        
    }
}

extension StatusEViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("searchText: \(searchText)")
        dataSource = DataHolder.shared.getAdditions()
        
        if !searchText.isEmpty {
            let queryOnlyDigits = searchText.filter("0123456789".contains)
            dataSource = dataSource.filter {
                ($0.title?.localizedCaseInsensitiveContains(searchText))! || ($0.name?.localizedCaseInsensitiveContains(searchText))! || ($0.title?.localizedCaseInsensitiveContains(queryOnlyDigits))!
            }
        }
        
        tableView.reloadData()
    }
    
}
