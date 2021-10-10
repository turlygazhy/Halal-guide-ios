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
    private var additions: [Addition]?
    var mosques: [Mosque]?
    var mosqueLocations: [MosqueLocation]?
    var regionCheckboxes: [CheckboxWithLabel]?
    var categoryCheckboxes: [CheckboxWithLabel]?
    
    private init() { }
    
    func isPlacesExist() -> Bool {
        //when we already init var places
        if places != nil && !places!.isEmpty {
            return true
        }
        
        //when no updates after last save
        if apiUpdated() {
            return false
        } else {
            let placesInMemory = PhoneMemory.readPlaces()
            if placesInMemory.isEmpty {
                return false
            }
            setPlaces(places: placesInMemory)
            return true
        }
        
    }
    
    func getPlaces() -> [Place] {
        places!
    }
    
    func setPlaces(places: [Place]) {
        PhoneMemory.savePlaces(places: places)
        self.places = places
    }
    
    func setAdditions(additions: [Addition]) {
        //todo save to memory?
        self.additions = additions
    }
    
    func getAdditions() -> [Addition] {
        additions!
    }
    
    func apiUpdated() -> Bool {
        let saveDate = PhoneMemory.getLastSaveDate()
        getApiUpdatedDate()
        
        
        return false //todo
    }
    
    func getApiUpdatedDate() { //todo not working
        let networkService = NetworkAdapter(sessionManager: sessionManager)
        networkService.load(context: GetApiUpdateDateContext()) { [weak self] serverResponse in
            guard let interactor = self else { return }
            guard serverResponse.isSuccess else { return }
            guard let placesResponse: ResponsePlaces = serverResponse.decode() else { return }
            
            guard let items = placesResponse.data else { return }
            print(items)//todo delete line
        }
    }
    
    private func getRegionNames() -> [String] {
        Array(Set(getPlaces().map{($0.location?.title)!}))
    }
    
    private func getCategoryNames() -> [String] {
        Array(Set(getPlaces().map{($0.category?.title)!}))
    }
    
    func getRegionCheckboxes() -> [CheckboxWithLabel] {
        if regionCheckboxes == nil || regionCheckboxes!.isEmpty {
            regionCheckboxes = getRegionNames().map{CheckboxWithLabel(checked: false, text: $0)}
        }
        return regionCheckboxes!//todo sort by alphabet
    }
    
    func setRegionCheckboxes(regionCheckboxes: [CheckboxWithLabel]) {
        self.regionCheckboxes = regionCheckboxes
    }
    
    func getCategoryCheckboxes() -> [CheckboxWithLabel] {
        if categoryCheckboxes == nil || categoryCheckboxes!.isEmpty {
            categoryCheckboxes = getCategoryNames().map{CheckboxWithLabel(checked: false, text: $0)}
        }
        return categoryCheckboxes!//todo sort by alphabet
    }
    
    func setCategoryCheckboxes(categoryCheckboxes: [CheckboxWithLabel]) {
        self.categoryCheckboxes = categoryCheckboxes
    }
    
    func clearFilters() {
        regionCheckboxes = nil
        categoryCheckboxes = nil
    }
}
