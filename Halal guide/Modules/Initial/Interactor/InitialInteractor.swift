//
//  InitialInteractor.swift
//  Halal guide
//
//  Created by Bagdat Zhunisbekov on 06.01.2021.
//  Copyright © 2021 Halaldamu. All rights reserved.
//

import Foundation

class InitialInteractor: InitialInteractorInput {
        
    private let presenter: InitialPresenterInput

    init(presenter: InitialPresenterInput) {
        self.presenter = presenter
    }
    
    func routeToMainPage() {
        self.presenter.routeToMainPage()
    }
}
