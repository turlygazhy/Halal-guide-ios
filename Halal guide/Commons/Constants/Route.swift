//
//  Route.swift
//  Halal guide
//
//  Created by Bagdat Zhunisbekov on 06.01.2021.
//  Copyright © 2021 Halaldamu. All rights reserved.
//

public enum Route: RouteProtocol {
    case root(endpoint: String)
    case getPlaces
    case getAdditions
    case getMosques(page: Int)
    case getMosqueLocation(id: String)

    public var serverUrl: String {
        switch self {
        case .getMosqueLocation:
            return Constants.baseMuftiatURL
        case .getMosques:
            return Constants.baseMuftiatURL
        default:
            return Constants.baseURL
        }
    }
}

extension Route {
    
    public var apiUrl: String {
        switch self {
        case .root(let endpoint): return endpoint
        case .getPlaces: return "/ru/api/mekemeler/1/1"
        case .getAdditions: return "/ru/api/qospalar/1/1"
        case .getMosques(let page): return "/mosques/?page="+String(page)
        case .getMosqueLocation(let id): return "/mosques/"+id
        }
    }
}
