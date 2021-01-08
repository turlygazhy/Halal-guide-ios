//
//  ResponsePlace.swift
//  Halal guide
//
//  Created by Bagdat Zhunisbekov on 08.01.2021.
//  Copyright © 2021 Halaldamu. All rights reserved.
//

import Foundation

struct ResponsePlaces: Codable {
    let success: Bool?
    let code: String?
    let message: String?
    let data: [Place]?
}
