//
//  SearchDetailViewController.swift
//  Halal guide
//
//  Created by Ерасыл Турлыгажы on 25.07.2021.
//  Copyright © 2021 Halaldamu. All rights reserved.
//

import Foundation
import UIKit

class SearchDetailViewController: BaseViewController {
    
    var router: SearchDetailRouterInput?
    private let itemDetail = UILabel()
    
    let place: Place
    
    init(place: Place){
        self.place = place
        super.init(nibName: nil, bundle: nil)//todo is it correct sending nil?
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        self.title = place.trademark_title
        
        itemDetail.text = "Название: \nПредприятие: \nКатегория: \nСтатус: \nРегион: \nТоварные знаки: \n TODO link"
        itemDetail.font = .systemFont(ofSize: 20)
        itemDetail.textColor = .black
        itemDetail.numberOfLines = 0
        view.addSubview(itemDetail)
    }
    
    private func setConstraints() {
        var layoutConstraints = [NSLayoutConstraint]()
        itemDetail.translatesAutoresizingMaskIntoConstraints = false
        layoutConstraints += [
            itemDetail.topAnchor.constraint(equalTo: view.topAnchor, constant: UIConstants.defaultPadding + 150),
            itemDetail.leftAnchor.constraint(equalTo: view.leftAnchor, constant: UIConstants.defaultPadding)
        ]
        
        NSLayoutConstraint.activate(layoutConstraints)
    }
}

extension SearchDetailViewController: SearchDetailViewInput {
    
}
