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
    
    private var places: [Place]?
    var mosques: [Mosque]?
    var mosqueLocations: [MosqueLocation]?
    
    private init() { }
    
    func isPlacesExist() -> Bool {
        places != nil && !places!.isEmpty
    }
    
    func getPlaces() -> [Place] {
        places! //todo
    }
    
    func setPlaces(places: [Place]) {
        //todo save to phone
        self.places = places
    }
}
