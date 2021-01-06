//
//  DeviceInfoStore.swift
//  Halal guide
//
//  Created by Bagdat Zhunisbekov on 06.01.2021.
//  Copyright © 2021 Halaldamu. All rights reserved.
//

import Foundation
import UIKit

class DeviceInfoStore {
    
    private let localStore: LocalStore
    
    static let shared = DeviceInfoStore()
    
    init(localStore: LocalStore = LocalStore()) {
        self.localStore = localStore
    }
    
    var deviceID: String {
        let deviceID: String
        if let storedDeviceID: String = localStore.getValue(forKey: .deviceId) {
            deviceID = storedDeviceID
        } else {
            deviceID = UIDevice.current.identifierForVendor?.uuidString ?? UUID().uuidString
            localStore.set(value: deviceID, forKey: .deviceId)
        }
        return deviceID
    }
}
