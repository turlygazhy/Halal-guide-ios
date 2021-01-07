//
//  SearchPresenter.swift
//  Halal guide
//
//  Created by Bagdat Zhunisbekov on 07.01.2021.
//  Copyright © 2021 Halaldamu. All rights reserved.
//

import Foundation

class SearchPresenter: SearchPresenterInput {
    
    weak private(set) var view: SearchViewInput!

    var baseView: BaseViewInputProtocol {
        return view as BaseViewInputProtocol
    }

    init(view: SearchViewInput) {
        self.view = view
    }
}
