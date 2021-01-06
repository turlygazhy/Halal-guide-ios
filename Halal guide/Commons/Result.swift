//
//  Result.swift
//  Halal guide
//
//  Created by Bagdat Zhunisbekov on 06.01.2021.
//  Copyright © 2021 Halaldamu. All rights reserved.
//

enum Result<T> {
    case success(T)
    case error(AppError)
}
