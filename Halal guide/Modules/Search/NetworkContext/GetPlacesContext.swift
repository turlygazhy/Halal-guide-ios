//
//  GetPlaces.swift
//  Halal guide
//
//  Created by Bagdat Zhunisbekov on 08.01.2021.
//  Copyright © 2021 Halaldamu. All rights reserved.
//

import Foundation

class GetPlacesContext: NetworkContext {
    
    var route: Route

    var encoding: NetworkEncoding { return .url }
    var method: NetworkMethod { return .get }

    init() {
        route = .getPlaces
    }
}
