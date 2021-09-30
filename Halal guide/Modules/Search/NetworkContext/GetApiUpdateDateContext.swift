//
//  GetApiUpdateDateContext.swift
//  Halal guide
//
//  Created by Ерасыл Турлыгажы on 30.09.2021.
//  Copyright © 2021 Halaldamu. All rights reserved.
//

import Foundation

class GetApiUpdateDateContext: NetworkContext {
    
    var route: Route
    
    var encoding: NetworkEncoding { return .url }
    var method: NetworkMethod { return .get }
    
    init() {
        route = .getApiUpdateDate
    }
    
}
