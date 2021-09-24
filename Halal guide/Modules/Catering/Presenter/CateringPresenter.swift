//
//  CateringPresenter.swift
//  Halal guide
//
//  Created by Bagdat Zhunisbekov on 07.01.2021.
//  Copyright © 2021 Halaldamu. All rights reserved.
//

import Foundation

class CateringPresenter: CateringPresenterInput {
    
    weak private(set) var view: CateringViewInput!

    var baseView: BaseViewInputProtocol {
        return view as BaseViewInputProtocol
    }

    init(view: CateringViewInput) {
        self.view = view
    }
    
    func setCafes(cafes: [PlaceViewModel]) {
        view?.setCafes(cafes: cafes)
    }
    
    func setShops(shops: [PlaceViewModel]) {
        view?.setShops(shops: shops)
    }
    
    func setMosqueLocations(mosques: [MosqueLocation]) {
        view?.setMosqueLocations(mosques: mosques)
    }
}
