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
        
        let searchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: 200, height: 20))//todo должно быть до фильтра
        //todo нужно убрать тайтл
        searchBar.placeholder = "Предприятие, товар, марка"
        searchBar.delegate = self
        let searchButton = UIBarButtonItem(customView: searchBar)
        navigationItem.leftBarButtonItem = searchButton
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "filter24"), style: .plain, target: self, action: #selector(filterTapped))
        navigationItem.rightBarButtonItem?.tintColor = AppColor.green.uiColor
        setupViews()
        setConstraints()
        
        interactor?.getPlaces()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        dataSource = DataUtil.filter(places: dataSource)
        tableView.reloadData()
        //todo нужно что бы когда выставлен фильтр это показывалось на иконке фильтра
    }
    
    @objc func filterTapped() {
        let storyboard = UIStoryboard(name: "Common", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "FilterViewController") as! FilterViewController
        navigationController?.pushViewController(viewController, animated: true)
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
        router?.openDetail(place: dataSource[indexPath.row])
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

extension SearchViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("searchText: \(searchText)")
        dataSource = DataUtil.filter(places: DataHolder.shared.getPlaces())
        if !searchText.isEmpty {
            dataSource = dataSource.filter {
                ($0.mekeme_title?.localizedCaseInsensitiveContains(searchText))! || ($0.trademark_title?.localizedCaseInsensitiveContains(searchText))! || ($0.trademarks?.localizedCaseInsensitiveContains(searchText))!
            }
        }
        tableView.reloadData()
    }
    
}
