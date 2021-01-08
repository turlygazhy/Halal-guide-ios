//
//  SearchViewCell.swift
//  Halal guide
//
//  Created by Bagdat Zhunisbekov on 08.01.2021.
//  Copyright © 2021 Halaldamu. All rights reserved.
//

import Foundation
import UIKit

class SearchViewCell: UITableViewCell, ReusableView {
    
    private let logoImageView = UIImageView(image: AppImage.defaultSpecialist.uiImage?.fitted(in: CGSize(width: 48.0, height: 48.0)))
    private let tradeMarkTitleLabel = UILabel()
    private let categoryLabel = UILabel()
    private let locationLabel = UILabel()
    private let statusLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        setupViews()
        setConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        logoImageView.isUserInteractionEnabled = true
        logoImageView.layer.cornerRadius = 24.0
        logoImageView.clipsToBounds = true
        logoImageView.contentMode = .scaleAspectFill
        logoImageView.layer.borderWidth = 1.0
        logoImageView.layer.borderColor = AppColor.seperator.cgColor
        addSubview(logoImageView)
        
        tradeMarkTitleLabel.text = "Trade Mark Title"
        tradeMarkTitleLabel.font = .systemFont(ofSize: 20.0)
        tradeMarkTitleLabel.textColor = .black
        tradeMarkTitleLabel.numberOfLines = 0
        addSubview(tradeMarkTitleLabel)

        categoryLabel.text = "Category"
        categoryLabel.font = .systemFont(ofSize: 14.0)
        categoryLabel.textColor = .black
        categoryLabel.numberOfLines = 0
        addSubview(categoryLabel)

        locationLabel.text = "Location"
        locationLabel.font = .systemFont(ofSize: 13.0)
        locationLabel.textColor = .black
        locationLabel.numberOfLines = 0
        addSubview(locationLabel)

        statusLabel.text = "Status"
        statusLabel.font = .systemFont(ofSize: 13.0)
        statusLabel.textColor = AppColor.green.uiColor
        statusLabel.numberOfLines = 0
        addSubview(statusLabel)
    }
    
    private func setConstraints() {
        var layoutConstraints = [NSLayoutConstraint]()
        
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        layoutConstraints += [
            logoImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            logoImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: UIConstants.defaultPadding),
            logoImageView.widthAnchor.constraint(equalToConstant: 48.0),
            logoImageView.heightAnchor.constraint(equalToConstant: 48.0)
        ]

        tradeMarkTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        layoutConstraints += [
            tradeMarkTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: UIConstants.defaultPadding/2),
            tradeMarkTitleLabel.leftAnchor.constraint(equalTo: logoImageView.rightAnchor, constant: UIConstants.defaultPadding),
            tradeMarkTitleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: UIConstants.defaultPadding * -1)
        ]

        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        layoutConstraints += [
            categoryLabel.topAnchor.constraint(equalTo: tradeMarkTitleLabel.bottomAnchor, constant: 5.0),
            categoryLabel.leftAnchor.constraint(equalTo: logoImageView.rightAnchor, constant: UIConstants.defaultPadding),
            categoryLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: UIConstants.defaultPadding * -1)
        ]

        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        layoutConstraints += [
            locationLabel.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: 5.0),
            locationLabel.leftAnchor.constraint(equalTo: logoImageView.rightAnchor, constant: UIConstants.defaultPadding),
            locationLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: UIConstants.defaultPadding * -1)
        ]

        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        layoutConstraints += [
            statusLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 5.0),
            statusLabel.leftAnchor.constraint(equalTo: logoImageView.rightAnchor, constant: UIConstants.defaultPadding),
            statusLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: UIConstants.defaultPadding * -1),
            statusLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: UIConstants.defaultPadding/2 * -1),
        ]

        NSLayoutConstraint.activate(layoutConstraints)
    }
    
    func set(place: Place) {
        logoImageView.loadImage(by: place.logo?.path)
        tradeMarkTitleLabel.text = place.trademark_title
        categoryLabel.text = place.category?.title
        locationLabel.text = place.location?.title
        
        if (place.status?.slug == "merzimi-ayaqtaldy") {
            statusLabel.textColor = AppColor.red.uiColor
        } else {
            statusLabel.textColor = AppColor.green.uiColor
        }
        statusLabel.text = place.status?.title
    }
}
