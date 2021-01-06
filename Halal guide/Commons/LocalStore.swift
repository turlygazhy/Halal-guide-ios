//
//  LocalStore.swift
//  Halal guide
//
//  Created by Bagdat Zhunisbekov on 06.01.2021.
//  Copyright © 2021 Halaldamu. All rights reserved.
//

import Foundation

class LocalStore {
    
    enum Key: String {
        case useBiometryToUnlock
        case usePinCodeToUnlock
        case authMethodsToUnlockRequested
        case appLanguage
        case appVersion
        case appBuild
        case deviceId
        case token
        case walletId
        case refreshToken
        case fireBaseId
    }

    func getValue<T>(forKey key: Key) -> T? {
        return UserDefaults.standard.value(forKey: key.rawValue) as? T
    }

    func set<T>(value: T?, forKey key: Key) {
        UserDefaults.standard.set(value, forKey: key.rawValue)
    }
}
