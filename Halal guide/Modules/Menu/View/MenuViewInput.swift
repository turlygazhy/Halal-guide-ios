//
//  MenuViewInput.swift
//  Halal guide
//
//  Created by Bagdat Zhunisbekov on 07.01.2021.
//  Copyright © 2021 Halaldamu. All rights reserved.
//

import Foundation

protocol MenuViewInput: BaseViewInputProtocol {
    func setData(menuItems: [String])
}
