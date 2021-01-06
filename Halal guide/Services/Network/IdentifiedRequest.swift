//
//  IdentifiedRequest.swift
//  Halal guide
//
//  Created by Bagdat Zhunisbekov on 06.01.2021.
//  Copyright © 2021 Halaldamu. All rights reserved.
//

import Foundation
import Alamofire

class IdentifiedRequest: CancelableRequest {
    let identifier: UUID
    let request: Request
    
    init(identifier: UUID, request: Request) {
        self.identifier = identifier
        self.request = request
    }
    
    func cancel() {
        request.cancel()
    }
}
