//
//  ParentRouterInput.swift
//  Halal guide
//
//  Created by Bagdat Zhunisbekov on 06.01.2021.
//  Copyright © 2021 Halaldamu. All rights reserved.
//

import Foundation

protocol ParentRouterInput: class {
    func pass(_ object: Any)
}

extension ParentRouterInput {    
    func pass(_ object: Any) { }
}
