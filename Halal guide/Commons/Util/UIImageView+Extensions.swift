//
//  UIIMageView+Extensions.swift
//  Halal guide
//
//  Created by Bagdat Zhunisbekov on 06.01.2021.
//  Copyright © 2021 Halaldamu. All rights reserved.
//

import Foundation
import ImageLoader

extension UIImageView {
    
    func loadAvatar(by avatarId: String?) {
        if let url = avatarId {
            self.load.request(with: Constants.imageURL + url)
        } else {
            self.image = UIImage(named: "defaultAvatar")
        }
    }
}
