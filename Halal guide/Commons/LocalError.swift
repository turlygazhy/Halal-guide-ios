//
//  LocalError.swift
//  Halal guide
//
//  Created by Bagdat Zhunisbekov on 06.01.2021.
//  Copyright © 2021 Halaldamu. All rights reserved.
//

enum LocalError: AppError {
    case `default`(_ description: String)
    case unknown
    
    var description: String {
        switch self {
        case .default(let description):
            return description
        case .unknown:
            return "Возникла непредвиденная ошибка. Приносим свои извинения за доставленные неудобства."
        }
    }
}
