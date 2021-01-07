//
//  StatusEPresenterInput.swift
//  Halal guide
//
//  Created by Bagdat Zhunisbekov on 07.01.2021.
//  Copyright © 2021 Halaldamu. All rights reserved.
//

import Foundation

class StatusEPresenter: StatusEPresenterInput {
    
    weak private(set) var view: StatusEViewInput!

    var baseView: BaseViewInputProtocol {
        return view as BaseViewInputProtocol
    }

    init(view: StatusEViewInput) {
        self.view = view
    }
}
