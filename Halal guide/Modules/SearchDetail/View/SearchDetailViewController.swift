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
    
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var mekemeTitleLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var regionLabel: UILabel!
    @IBOutlet weak var trademarksLabel: UILabel!
    @IBOutlet weak var openInWebTextView: UITextView!
    
    var place: Place?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    func setPlace(place: Place) {
        self.place = place
    }
    
    func setupViews() {
        logoImageView.loadImage(by: place!.logo?.path)
        titleLabel.text = place?.trademark_title
        mekemeTitleLabel.text = place?.mekeme_title
        categoryLabel.text = place?.category?.title
        statusLabel.text = place?.status?.title
        //        statusLabel.textColor todo
        regionLabel.text = place?.location?.title
        trademarksLabel.text = place?.trademarks
        if trademarksLabel.text == "" {
            trademarksLabel.text = "-"
        }
        setMoreLink()
    }
    
    func setMoreLink() {
        let path = "https://halaldamu.kz/ru/m/\(place!.slug!)"
        let text = openInWebTextView.text ?? ""
        let attributedString = NSAttributedString.makeHyperLink(for: path, in: text, as: text)
        openInWebTextView.attributedText = attributedString
        openInWebTextView.font = UIFont.systemFont(ofSize: 20)
    }
    //todo add open in map buttons as in android
}
