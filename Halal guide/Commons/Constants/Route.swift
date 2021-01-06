//
//  Route.swift
//  Halal guide
//
//  Created by Bagdat Zhunisbekov on 06.01.2021.
//  Copyright © 2021 Halaldamu. All rights reserved.
//

public enum Route: RouteProtocol {
    case root(endpoint: String)
    case authLogin
    
    public var serverUrl: String { return Constants.baseURL }
}

extension Route {
    
    public var apiUrl: String {
        switch self {
        case .root(let endpoint): return endpoint
        case .authLogin: return "/auth/login"
        }
    }
}
