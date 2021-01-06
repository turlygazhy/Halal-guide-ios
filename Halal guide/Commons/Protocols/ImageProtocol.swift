//
//  ImageProtocol.swift
//  Halal guide
//
//  Created by Bagdat Zhunisbekov on 06.01.2021.
//  Copyright © 2021 Halaldamu. All rights reserved.
//

import UIKit

protocol ImageProtocol {
    /// UIImage asset value
    var rawValue: String { get }
}

extension ImageProtocol {
    
    /// Return a value as **UIImage**
    var uiImage: UIImage? {
        return UIImage(named: rawValue)
    }
    
    /// Return a value as **CGImage**
    var cgImage: CGImage? {
        return self.uiImage?.cgImage
    }
}
