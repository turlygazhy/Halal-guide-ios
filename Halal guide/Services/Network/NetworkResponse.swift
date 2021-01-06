//
//  NetworkResponse.swift
//  Halal guide
//
//  Created by Bagdat Zhunisbekov on 06.01.2021.
//  Copyright © 2021 Halaldamu. All rights reserved.
//

import Foundation

protocol NetworkResponse {
    var isSuccess: Bool { get }
    var data: Data? { get }
    var networkError: NetworkError? { get }
}

extension NetworkResponse {
    
    var json: [String: Any]? {
        guard let data = data,
              let result = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            else { return nil }
        return result
    }
    
    var string: String? {
        guard let data = data else { return nil }
        return String(data: data, encoding: String.Encoding.utf8)
    }
    
    func decode<T: Decodable>() -> T? {
        guard let data = data else { return nil }
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            dump(error)
            return nil
        }
    }
    
}
