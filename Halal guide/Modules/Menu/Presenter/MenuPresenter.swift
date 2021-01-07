//
//  MenuPresenter.swift
//  Halal guide
//
//  Created by Bagdat Zhunisbekov on 07.01.2021.
//  Copyright © 2021 Halaldamu. All rights reserved.
//

import Foundation

class MenuPresenter: MenuPresenterInput {
    
    weak private(set) var view: MenuViewInput!

    var baseView: BaseViewInputProtocol {
        return view as BaseViewInputProtocol
    }

    init(view: MenuViewInput) {
        self.view = view
    }
}
