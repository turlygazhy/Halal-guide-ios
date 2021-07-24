//
//  MenuItem.swift
//  Halal guide
//
//  Created by Ерасыл Турлыгажы on 24.07.2021.
//  Copyright © 2021 Halaldamu. All rights reserved.
//

import Foundation

enum MenuItem: CustomStringConvertible {
    case feedback
    case instruction
    case giveMark
    case share
    
    var description: String {
        switch self {
        case .feedback:
            return "Обратная связь"
        case .instruction:
            return "Инструкции"
        case .giveMark:
            return "Оцените приложение"
        case .share:
            return "Поделиться"
        }
    }
}
