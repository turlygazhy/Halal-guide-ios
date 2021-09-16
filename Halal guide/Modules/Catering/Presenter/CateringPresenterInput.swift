//
//  CateringPresenterInput.swift
//  Halal guide
//
//  Created by Bagdat Zhunisbekov on 07.01.2021.
//  Copyright © 2021 Halaldamu. All rights reserved.
//

import Foundation

protocol CateringPresenterInput: BasePresenterInput {
    func setCafes(cafes: [PlaceViewModel])
    func setShops(shops: [PlaceViewModel])
    func setMosqueLocations(mosques: [MosqueLocation])
}
