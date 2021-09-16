//
//  GetMosquesContext.swift
//  Halal guide
//
//  Created by Bagdat Zhunisbekov on 16.09.2021.
//  Copyright © 2021 Halaldamu. All rights reserved.
//

import Foundation

class GetMosquesContext: NetworkContext {
    
    var route: Route

    var encoding: NetworkEncoding { return .url }
    var method: NetworkMethod { return .get }

    init(page: Int) {
        route = .getMosques(page: page)
    }
}
