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
        places != nil && !places!.isEmpty
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
    
    func apiUpdated(networkService: NetworkService) -> Bool {
        let saveDate = PhoneMemory.readApiUpdateDate()
        getApiUpdatedDate(networkService: networkService)
        
        
        return false //todo
    }
    
    func getApiUpdatedDate(networkService: NetworkService) -> String {
        var updatedDate: String?
        networkService.load(context: GetApiUpdateDateContext()) { [weak self] serverResponse in
            guard let interactor = self else { return }
            guard serverResponse.isSuccess else { return }
            guard let placesResponse: ResponsePlaces = serverResponse.decode() else { return }
            
            guard let items = placesResponse.data else { return }
            updatedDate = items[0].updated_at?.date
        }
        return updatedDate != nil ? updatedDate! : ""
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
        return regionCheckboxes!.map{ CheckboxWithLabel(checked: $0.checked!, text: $0.text!) }
        //todo sort by alphabet
    }
    
    func setRegionCheckboxes(regionCheckboxes: [CheckboxWithLabel]) {
        self.regionCheckboxes = regionCheckboxes.map{ CheckboxWithLabel(checked: $0.checked!, text: $0.text!) }
    }
    
    func getCategoryCheckboxes() -> [CheckboxWithLabel] {
        if categoryCheckboxes == nil || categoryCheckboxes!.isEmpty {
            categoryCheckboxes = getCategoryNames().map{CheckboxWithLabel(checked: false, text: $0)}
        }
        return categoryCheckboxes!.map{ CheckboxWithLabel(checked: $0.checked!, text: $0.text!) }//todo sort by alphabet
    }
    
    func setCategoryCheckboxes(categoryCheckboxes: [CheckboxWithLabel]) {
        self.categoryCheckboxes = categoryCheckboxes.map{ CheckboxWithLabel(checked: $0.checked!, text: $0.text!) }
    }
    
    func clearFilters() {
        regionCheckboxes = nil
        categoryCheckboxes = nil
    }
}
