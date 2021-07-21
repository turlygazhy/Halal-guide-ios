//
//  GetAdditionsContext.swift
//  Halal guide
//
//  Created by Ерасыл Турлыгажы on 21.07.2021.
//  Copyright © 2021 Halaldamu. All rights reserved.
//

import Foundation

class GetAdditionsContext: NetworkContext {
    
    var route: Route
    
    var encoding: NetworkEncoding { return .url }
    var method: NetworkMethod { return .get }
    
    init() {
        route = .getAdditions
    }
}
