//
//  AppLanguage.swift
//  Halal guide
//
//  Created by Bagdat Zhunisbekov on 06.01.2021.
//  Copyright © 2021 Halaldamu. All rights reserved.
//

import Foundation

enum AppLanguage: String, CaseIterable {
    case kk, en, ru
    
    var title: String {
        switch self {
        case .kk: return "Қазақ"
        case .en: return "English"
        case .ru: return "Русский"
        }
    }
    
    var locale: Locale {
        let identifier: String
        switch self {
        case .kk:
            identifier = "kk"
        case .en:
            identifier = "en"
        case .ru:
            identifier = "ru"
        }
        return Locale(identifier: identifier)
    }
}
