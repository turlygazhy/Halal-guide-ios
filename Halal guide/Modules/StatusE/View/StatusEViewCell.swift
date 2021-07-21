//
//  StatusEViewCell.swift
//  Halal guide
//
//  Created by Ерасыл Турлыгажы on 21.07.2021.
//  Copyright © 2021 Halaldamu. All rights reserved.
//

import Foundation
import UIKit

class StatusEViewCell: UITableViewCell, ReusableView {
    
    private let additionTitleLabel = UILabel()
    private let statusLabel = UILabel()
    private let additionNameLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        setupViews()
        setConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        additionTitleLabel.text = "Addition title"
        additionTitleLabel.font = .systemFont(ofSize: 20.0)
        additionTitleLabel.textColor = .black
        additionTitleLabel.numberOfLines = 0
        addSubview(additionTitleLabel)
        
        statusLabel.text = "Status"
        statusLabel.font = .systemFont(ofSize: 14.0)
        statusLabel.textColor = .black
        statusLabel.numberOfLines = 0
        addSubview(statusLabel)
        
        additionNameLabel.text = "Addition name"
        additionNameLabel.font = .systemFont(ofSize: 14.0)
        additionNameLabel.textColor = .black
        additionNameLabel.numberOfLines = 0
        addSubview(additionNameLabel)
    }
    
    private func setConstraints(){
        var layoutConstraints = [NSLayoutConstraint]()
        
        additionTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        layoutConstraints += [
            additionTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            additionTitleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: UIConstants.defaultPadding),
            additionTitleLabel.widthAnchor.constraint(equalToConstant: 48.0),
            additionTitleLabel.heightAnchor.constraint(equalToConstant: 48.0)
        ]

        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        layoutConstraints += [
            statusLabel.topAnchor.constraint(equalTo: topAnchor, constant: UIConstants.defaultPadding/2),
            statusLabel.leftAnchor.constraint(equalTo: additionTitleLabel.rightAnchor, constant: UIConstants.defaultPadding),
            statusLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: UIConstants.defaultPadding * -1)
        ]

        additionNameLabel.translatesAutoresizingMaskIntoConstraints = false
        layoutConstraints += [
            additionNameLabel.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 5.0),
            additionNameLabel.leftAnchor.constraint(equalTo: additionTitleLabel.rightAnchor, constant: UIConstants.defaultPadding),
            additionNameLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: UIConstants.defaultPadding * -1)
        ]
        
        NSLayoutConstraint.activate(layoutConstraints)
    }
    
    func set(addition: Addition) {
        additionTitleLabel.text = addition.title
        statusLabel.text = addition.status?.title
        additionNameLabel.text = addition.name
        
        if addition.status?.slug == "" {//todo
            statusLabel.textColor = AppColor.red.uiColor
        } else {
            statusLabel.textColor = AppColor.green.uiColor
        }
    }
}
