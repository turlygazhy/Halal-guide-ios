//
//  Place.swift
//  Halal guide
//
//  Created by Bagdat Zhunisbekov on 08.01.2021.
//  Copyright © 2021 Halaldamu. All rights reserved.
//

import Foundation

struct Place: Codable {
    let id: Int?
    let mekeme_title: String?
    let trademark_title: String?
    let slug: String?
    let category_id: Int?
    let registration_number: String?
    let date_start: String?
    let date_end: String?
    let superviser_id: Int?
    let status_id: Int?
    let status_desc: String?
    let phone: String?
    let mail: String?
    let manager: String?
    let address: String?
    let trademarks: String?
    let location_id: Int?
    let keywords: String?
    let website: String?
    let deleted_at: String?
    let created_at: Time?
    let updated_at: Time?
    //let maplink: [MapLink]?
    let category: Category?
    let status: Title?
    let location: Title?
    let supervisor: SuperVisor?
    let logo: Logo?    
}

struct Time: Codable {
    let date: String?
    let timezone_type: Int?
    let timezone: String?
}

struct MapLink: Codable {
    let address: String?
    let link: String?
}

struct Category: Codable {
    let id: Int?
    let title: String?
    let slug: String?
    let icon: String?
}

struct Title: Codable {
    let id: Int?
    let title: String?
    let slug: String?
}

struct SuperVisor: Codable {
    let id: Int?
    let title: String?
    let slug: String?
    let image: String?
    let phone: String?
    let mail: String?
    let location_id: Int?
}

struct Logo: Codable {
    let path: String?
}
