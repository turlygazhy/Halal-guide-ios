//
//  GetMosqueLocation.swift
//  Halal guide
//
//  Created by Bagdat Zhunisbekov on 16.09.2021.
//  Copyright © 2021 Halaldamu. All rights reserved.
//

import Foundation

class GetMosqueLocationContext: NetworkContext {
    
    var route: Route

    var encoding: NetworkEncoding { return .url }
    var method: NetworkMethod { return .get }

    init(id: String) {
        route = .getMosqueLocation(id: id)
    }
}
