//
//  Collection+Extensions.swift
//  Halal guide
//
//  Created by Bagdat Zhunisbekov on 16.09.2021.
//  Copyright © 2021 Halaldamu. All rights reserved.
//

extension Collection {

    /// Returns the element at the specified index if it is within bounds, otherwise nil.
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
