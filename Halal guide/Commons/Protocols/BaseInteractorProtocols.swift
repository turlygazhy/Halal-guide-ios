//
//  BaseInteractorProtocols.swift
//  Halal guide
//
//  Created by Bagdat Zhunisbekov on 06.01.2021.
//  Copyright © 2021 Halaldamu. All rights reserved.
//

import Foundation

protocol ViewLoadable {
    func viewLoaded()
}

extension ViewLoadable {
    func viewLoaded() {
        
    }
}

protocol BaseInteractorInput: ViewLoadable {
    
}
