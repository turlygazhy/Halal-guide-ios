//
//  SearchPresenterInput.swift
//  Halal guide
//
//  Created by Bagdat Zhunisbekov on 07.01.2021.
//  Copyright © 2021 Halaldamu. All rights reserved.
//

import Foundation

protocol SearchPresenterInput: BasePresenterInput {
    func setData(places: [Place])
}
