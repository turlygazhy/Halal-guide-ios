//
//  LoggableResponse.swift
//  Halal guide
//
//  Created by Bagdat Zhunisbekov on 06.01.2021.
//  Copyright © 2021 Halaldamu. All rights reserved.
//

import Foundation

protocol LoggableResponse {
    
    var response: HTTPURLResponse? { get }
    var request: URLRequest? { get }
    var error: Error? { get }
    var data: Data? { get }
}
