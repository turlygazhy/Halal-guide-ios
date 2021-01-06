//
//  RouteProtocol.swift
//  Halal guide
//
//  Created by Bagdat Zhunisbekov on 06.01.2021.
//  Copyright © 2021 Halaldamu. All rights reserved.
//

import Foundation

/// URL route protocol;
/// For **enum** extension with raw type **String**
public protocol RouteProtocol {
    
    /// Server URL
    var serverUrl: String { get }
    
    /// route API
    var apiUrl: String { get }
}

public extension RouteProtocol {
    
    /// Get complete URL route
    var urlString: String { return serverUrl + apiUrl }
}
