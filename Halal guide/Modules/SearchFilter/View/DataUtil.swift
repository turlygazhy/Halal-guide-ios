//
//  DataUtil.swift
//  Halal guide
//
//  Created by Ерасыл Турлыгажы on 10.10.2021.
//  Copyright © 2021 Halaldamu. All rights reserved.
//

import Foundation

class DataUtil {
    
    static func filter(places: [Place]) -> [Place] {
        places.filter{ isCategoryOn(place: $0) && isRegionOn(place: $0) }
    }
    
    static func isCategoryOn(place: Place) -> Bool {
        let category = place.category?.title
        let categories = DataHolder.shared.getCategoryCheckboxes()
        
        let categoryFilterUsed = !categories.filter{ $0.checked! }.isEmpty
        if !categoryFilterUsed {
            return true
        }
        
        return categories.filter{ $0.checked! }.map{ $0.text }.contains(category)
    }
    
    static func isRegionOn(place: Place) -> Bool {
        let region = place.location?.title
        let regions = DataHolder.shared.getRegionCheckboxes()
        
        let regionFilterUsed = !regions.filter{ $0.checked! }.isEmpty
        if !regionFilterUsed {
            return true
        }
        
        let temp = regions.filter{ $0.checked! }.map{ $0.text }.contains(region)
        return temp //todo inline
    }
}
