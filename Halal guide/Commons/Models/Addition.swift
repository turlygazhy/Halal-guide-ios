//
//  Addition.swift
//  Halal guide
//
//  Created by Ерасыл Турлыгажы on 21.07.2021.
//  Copyright © 2021 Halaldamu. All rights reserved.
//

import Foundation

struct Addition: Codable {
    let id: Int?
    let title: String?
    let slug: String?
    let desc: String?
    let status_id: Int?
    let status_desc: String?
    let created_at: Time?
    let updated_at: Time?
    let deleted_at: Time?
    let name: String?
    let category: String?
    let status: Status?
}

struct Status: Codable {
    let id: Int?
    let title: String?
    let slug: String?
    let name: String?
}
