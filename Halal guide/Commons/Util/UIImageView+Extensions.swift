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
    
    func loadImage(by path: String?, defaultImage: UIImage? = UIImage.init(named: "appLogo")) {
        if let url = path {
            self.load.request(with: url)
        } else {
            self.image = defaultImage
        }
    }
}
