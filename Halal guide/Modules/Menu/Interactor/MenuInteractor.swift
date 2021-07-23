//
//  MenuInteractor.swift
//  Halal guide
//
//  Created by Bagdat Zhunisbekov on 07.01.2021.
//  Copyright © 2021 Halaldamu. All rights reserved.
//

import Foundation

class MenuInteractor: MenuInteractorInput {
    
    private let presenter: MenuPresenterInput

    init(presenter: MenuPresenterInput) {
        self.presenter = presenter
    }
    
    func getMenuItems() {
        self.presenter.setData(menuItems: ["Обратная связь", "Инструкции", "Оцените приложение", "Поделиться"])
    }
}
