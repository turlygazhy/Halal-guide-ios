//
//  NetworkError.swift
//  Halal guide
//
//  Created by Bagdat Zhunisbekov on 06.01.2021.
//  Copyright © 2021 Halaldamu. All rights reserved.
//

import Foundation

enum NetworkError: AppError {
    case serverError(description: String)
    case dataLoad
    case unknown
    case noConnection
    case unauthorized
    case cancelled
    case noUser
    
    var description: String {
        switch self {
        case .serverError(let description):
            return description
        case .dataLoad:
            return "Возникла ошибка при загрузке данных. Приносим свои извинения за доставленные неудобства."
        case .unknown:
            return "Возникла непредвиденная ошибка. Приносим свои извинения за доставленные неудобства."
        case .noConnection:
            return "Отсутствует интернет соединение"
        case .unauthorized:
            return "Неверный логин или пароль"
        case .cancelled:
            return "Запрос был отменен"
        case .noUser:
            return "Логин или пароль неверный"
        }
    }
}
