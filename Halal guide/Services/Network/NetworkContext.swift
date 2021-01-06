//
//  Context.swift
//  Halal guide
//
//  Created by Bagdat Zhunisbekov on 06.01.2021.
//  Copyright © 2021 Halaldamu. All rights reserved.
//

import Foundation

protocol NetworkContext {
    var route: Route { get }
    var method: NetworkMethod { get }
    var parameters: [String: Any] { get }
    var encoding: NetworkEncoding { get }
    var httpBody: Data? { get }
    var headers: [String: String] { get }
}

extension NetworkContext {
    
    var urlString: String { return route.urlString }
    
    var parameters: [String: Any] { return [:] }
    
    var encoding: NetworkEncoding { return .url }
    
    static func encode<T: Codable>(_ object: T) -> Any? {
        if let data = try? JSONEncoder().encode(object) {
            return try? JSONSerialization.jsonObject(with: data)
        }
        return nil
    }
    
    var httpBody: Data? { return nil }
    
    var headers: [String: String] { return [:] }
}

enum NetworkMethod { case get, post, put, patch, delete }

enum NetworkEncoding { case json, url }
