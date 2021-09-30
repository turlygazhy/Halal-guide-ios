//
//  PhoneMemory.swift
//  Halal guide
//
//  Created by Ерасыл Турлыгажы on 29.09.2021.
//  Copyright © 2021 Halaldamu. All rights reserved.
//

import Foundation

class PhoneMemory {
    
    static let PLACES_KEY = "PLACES_KEY"
    
    static func savePlaces(places: [Place]){
        do {
            let jsonEncoder = JSONEncoder()
            let jsonData = try jsonEncoder.encode(places)
            let json = String(data: jsonData, encoding: String.Encoding.utf8)
            UserDefaults.standard.set(json, forKey: PhoneMemory.PLACES_KEY)
        } catch {
            //todo
        }
        
    }
    
    static func readPlaces() -> [Place] {
        do {
            let json = UserDefaults.standard.string(forKey: PhoneMemory.PLACES_KEY)
            if json == nil {
                return []
            }
            let jsonDecoder = JSONDecoder()
            let places = try jsonDecoder.decode([Place].self, from: (json?.data(using: .utf8))!)
            return places
        } catch {
            return []
        }
    }
    
    static func getLastSaveDate() -> String {
        "" //todo
    }
    
}
