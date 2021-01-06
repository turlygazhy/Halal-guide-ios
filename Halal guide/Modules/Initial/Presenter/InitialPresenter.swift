//
//  InitialPresenter.swift
//  Halal guide
//
//  Created by Bagdat Zhunisbekov on 06.01.2021.
//  Copyright © 2021 Halaldamu. All rights reserved.
//

import Foundation

class InitialPresenter: InitialPresenterInput {
    
    weak private(set) var view: InitialViewInput!

    var baseView: BaseViewInputProtocol {
        return view as BaseViewInputProtocol
    }

    init(view: InitialViewInput) {
        self.view = view
    }
    
    func routeToMainPage() {
        self.view.routeToMainPage()
    }
}
