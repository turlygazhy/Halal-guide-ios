//
//  FailureNetworkResponse.swift
//  Halal guide
//
//  Created by Bagdat Zhunisbekov on 06.01.2021.
//  Copyright © 2021 Halaldamu. All rights reserved.
//

import Foundation

class FailureNetworkResponse: NetworkResponse {
    var isSuccess: Bool { return false }
    var data: Data? { return nil }
    let networkError: NetworkError?
    
    init(networkError: NetworkError) {
        self.networkError = networkError
    }
}
