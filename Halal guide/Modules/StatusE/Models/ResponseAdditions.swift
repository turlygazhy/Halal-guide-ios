//
//  ResponseAddition.swift
//  Halal guide
//
//  Created by Ерасыл Турлыгажы on 21.07.2021.
//  Copyright © 2021 Halaldamu. All rights reserved.
//

import Foundation

struct ResponseAdditions: Codable {
    let success: Bool?
    let code: String?
    let message: String?
    let data: [Addition]?
}
