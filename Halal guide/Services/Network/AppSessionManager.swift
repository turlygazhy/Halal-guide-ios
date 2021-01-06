//
//  AppSessionManager.swift
//  Halal guide
//
//  Created by Bagdat Zhunisbekov on 06.01.2021.
//  Copyright © 2021 Halaldamu. All rights reserved.
//

import Foundation
import Alamofire
import UIKit

class AppSessionManager: SessionManager {
    
    func requestAccessToken(networkAdapter: NetworkAdapter, onCompletion pass: @escaping (Result<Void>) -> Void) {
        LocalStore().set(value: "", forKey: .token)
    }
}
