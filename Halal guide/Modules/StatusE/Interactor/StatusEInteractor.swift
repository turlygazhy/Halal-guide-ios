//
//  StatusEInteractor.swift
//  Halal guide
//
//  Created by Bagdat Zhunisbekov on 07.01.2021.
//  Copyright © 2021 Halaldamu. All rights reserved.
//

import Foundation

class StatusEInteractor: StatusEInteractorInput {
    
    private let presenter: StatusEPresenterInput

    init(presenter: StatusEPresenterInput) {
        self.presenter = presenter
    }
}
