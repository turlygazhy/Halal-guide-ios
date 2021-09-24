//
//  LatLng.swift
//  Halal guide
//
//  Created by Ерасыл Турлыгажы on 23.09.2021.
//  Copyright © 2021 Halaldamu. All rights reserved.
//

import Foundation

class LatLng {
    
    var latitude: Double = .zero
    var longitude: Double = .zero
    
    init(link: String) {
        do {
            let regex = try NSRegularExpression(pattern: "\\d{2}.\\d{5,}")
            let results = regex.matches(in: link, range: NSRange(link.startIndex..., in: link)).map {
                String(link[Range($0.range, in: link)!])
            }
            
            if results.count < 2 {
                print("Cannot parse link \(link)")
                return
            }
            
            let lat = Double(results[results.count - 1])
            let lng = Double(results[results.count - 2])
            
            if link.contains("2gis") {
                latitude = lat ?? .zero
                longitude = lng ?? .zero
            } else {
                latitude = lng ?? .zero
                longitude = lat ?? .zero
            }
        } catch {
            print("Cannot parse link \(link)")
        }
    }
}
