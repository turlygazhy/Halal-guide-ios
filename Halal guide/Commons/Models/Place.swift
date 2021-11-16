//
//  Place.swift
//  Halal guide
//
//  Created by Bagdat Zhunisbekov on 08.01.2021.
//  Copyright © 2021 Halaldamu. All rights reserved.
//

import Foundation
import UIKit

struct Place: Codable {
    enum CodingKeys: String, CodingKey {
        case id
        case mekeme_title
        case trademark_title
        case slug
        case category_id
        case registration_number
        case date_start
        case date_end
        case superviser_id
        case status_id
        case status_desc
        case phone
        case mail
        case manager
        case address
        case trademarks
        case location_id
        case keywords
        case website
        case deleted_at
        case created_at
        case updated_at
        case maplink
        case category
        case status
        case location
        case supervisor
        case logo
    }
    
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
    let maplink: [MapLink]?
    let category: Category?
    let status: Title?
    let location: Title?
    let supervisor: SuperVisor?
    let logo: Logo?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(Int.self, forKey: .id)
        mekeme_title = try container.decodeIfPresent(String.self, forKey: .mekeme_title)
        trademark_title = try container.decodeIfPresent(String.self, forKey: .trademark_title)
        slug = try container.decodeIfPresent(String.self, forKey: .slug)
        category_id = try container.decodeIfPresent(Int.self, forKey: .category_id)
        registration_number = try container.decodeIfPresent(String.self, forKey: .registration_number)
        date_start = try container.decodeIfPresent(String.self, forKey: .date_start)
        date_end = try container.decodeIfPresent(String.self, forKey: .date_end)
        superviser_id = try container.decodeIfPresent(Int.self, forKey: .superviser_id)
        status_id = try container.decodeIfPresent(Int.self, forKey: .status_id)
        status_desc = try container.decodeIfPresent(String.self, forKey: .status_desc)
        phone = try container.decodeIfPresent(String.self, forKey: .phone)
        mail = try container.decodeIfPresent(String.self, forKey: .mail)
        manager = try container.decodeIfPresent(String.self, forKey: .manager)
        address = try container.decodeIfPresent(String.self, forKey: .address)
        trademarks = try container.decodeIfPresent(String.self, forKey: .trademarks)
        
        location_id = try container.decodeIfPresent(Int.self, forKey: .location_id)
        keywords = try container.decodeIfPresent(String.self, forKey: .keywords)
        website = try container.decodeIfPresent(String.self, forKey: .website)
        deleted_at = try container.decodeIfPresent(String.self, forKey: .deleted_at)
        created_at = try container.decodeIfPresent(Time.self, forKey: .created_at)
        updated_at = try container.decodeIfPresent(Time.self, forKey: .updated_at)
        category = try container.decodeIfPresent(Category.self, forKey: .category)
        status = try container.decodeIfPresent(Title.self, forKey: .status)
        location = try container.decodeIfPresent(Title.self, forKey: .location)
        supervisor = try container.decodeIfPresent(SuperVisor.self, forKey: .supervisor)
        logo = try container.decodeIfPresent(Logo.self, forKey: .logo)
        
        if let maplink = try? container.decodeIfPresent([MapLink].self, forKey: .maplink) {
            self.maplink = maplink
        } else {
            maplink = .none
        }
    }
    
    func getStatusColor() -> UIColor {
        if (status?.slug == "merzimi-ayaqtaldy") {
            return AppColor.red.uiColor
        } else {
            return AppColor.green.uiColor
        }
    }
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

struct ResponseMosqueList: Codable {
    let count: Int?
    let next: String?
    let previous: String?
    let results: [Mosque]?
}

struct Mosque: Codable {
    let id: Int?
    let title: String?
    let image: String?
    let slug: String?
}

struct MosqueLocation: Codable {
    let id: Int?
    let title: String?
    let image: String?
    let slug: String?
    let address: String?
    let lat: String?
    let lng: String?
    let description: String?
    let text: String?
    let created_at: String?
}
