//
//  Constants.swift
//  Halal guide
//
//  Created by Bagdat Zhunisbekov on 06.01.2021.
//  Copyright © 2021 Halaldamu. All rights reserved.
//

import Foundation

struct Constants {
    static let stand = "Production"
    static let host = "halaldamu.kz"
    static let muftiat = "api.muftyat.kz"
    static let googleServiceInfoPlistFileName = "GoogleService-Info"

    static let baseURL = "https://" + host
    static let baseMuftiatURL = "https://" + muftiat
    
    static let imageURL = baseURL + "/api/file/avatar/"
    
    static let token = "token"
    static let apiKey = "AIzaSyBGu_JaV9JSBox1ubQj6URpwIVhrH3uIoQ"
}
