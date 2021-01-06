//
//  ImageProtocol.swift
//  Hala Guide
//
//  Created by Bagdat Zhunisbekov on 1/6/21.
//  Copyright © 2021 Bagdat Zhunisbekov. All rights reserved.
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
