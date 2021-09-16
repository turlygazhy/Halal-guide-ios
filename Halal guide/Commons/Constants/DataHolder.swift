//
//  DataHolder.swift
//  Halal guide
//
//  Created by Bagdat Zhunisbekov on 16.09.2021.
//  Copyright © 2021 Halaldamu. All rights reserved.
//

import Foundation

class DataHolder {

    static let shared = DataHolder()

    var places: [Place]?
    var mosques: [Mosque]?
    var mosqueLocations: [MosqueLocation]?
    
    private init() { }
}
