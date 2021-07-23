//
//  MenuViewCell.swift
//  Halal guide
//
//  Created by Ерасыл Турлыгажы on 23.07.2021.
//  Copyright © 2021 Halaldamu. All rights reserved.
//

import Foundation
import UIKit

class MenuViewCell: UITableViewCell, ReusableView {
    
    private let menuItemTitle = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        menuItemTitle.text = "Menu item"
        addSubview(menuItemTitle)
    }
    
    private func setConstraints() {
        var layoutConstraints = [NSLayoutConstraint]()
        
        menuItemTitle.translatesAutoresizingMaskIntoConstraints = false
        layoutConstraints += [
            menuItemTitle.centerYAnchor.constraint(equalTo: centerYAnchor),
            menuItemTitle.leftAnchor.constraint(equalTo: leftAnchor, constant: UIConstants.defaultPadding),
            menuItemTitle.widthAnchor.constraint(equalToConstant: 60.0),
            menuItemTitle.heightAnchor.constraint(equalToConstant: 48.0),
            menuItemTitle.rightAnchor.constraint(equalTo: rightAnchor, constant: UIConstants.defaultPadding * -1),
            menuItemTitle.bottomAnchor.constraint(equalTo: bottomAnchor, constant: UIConstants.defaultPadding * -1)
        ]
        
        NSLayoutConstraint.activate(layoutConstraints)
    }
    
    func set(menuItem: String) {
        menuItemTitle.text = menuItem
    }
}
