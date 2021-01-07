//
//  CateringInteractor.swift
//  Halal guide
//
//  Created by Bagdat Zhunisbekov on 07.01.2021.
//  Copyright © 2021 Halaldamu. All rights reserved.
//

import Foundation

class CateringInteractor: CateringInteractorInput {
    
    private let presenter: CateringPresenterInput

    init(presenter: CateringPresenterInput) {
        self.presenter = presenter
    }
}
