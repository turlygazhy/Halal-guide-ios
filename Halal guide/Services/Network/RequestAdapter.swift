//
//  RequestAdapter.swift
//  Halal guide
//
//  Created by Bagdat Zhunisbekov on 06.01.2021.
//  Copyright © 2021 Halaldamu. All rights reserved.
//

import Alamofire

class AppRequestAdapter: RequestAdapter {
    
    var accessToken: String?
    var refreshToken: String?
    var customerId: Int?
    var registrationToken: String?
    let userAgent: String
    let appName = "HalalGuide-iOS"
    var notificationToken: String?
    var systemVersion: String
    var deviceId: String
    var deviceName: String
    var clientVersion: String
    
    init() {
        systemVersion = UIDevice.current.systemVersion
        deviceId = DeviceInfoStore.shared.deviceID
        let labelVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] ?? ""
        let userAgentString = "mobile/\(deviceId)/IOS/buildVersion/\(labelVersion)"
            .replacingOccurrences(of: " ", with: "")
            .replacingOccurrences(of: " ", with: "_")
        self.userAgent = userAgentString
        deviceName = UIDevice.current.name
        clientVersion = "\(labelVersion)".replacingOccurrences(of: " ", with: "")
    }
    
    func adapt(_ urlRequest: URLRequest) throws -> URLRequest {
        var urlRequest = urlRequest
        
        if let accessToken: String = LocalStore().getValue(forKey: .token), !accessToken.isEmpty {
            urlRequest.setValue("Bearer " + accessToken, forHTTPHeaderField: "Authorization")
        }
        if let registrationToken = registrationToken {
             urlRequest.setValue(registrationToken, forHTTPHeaderField: "registration-token")
        }
        if let notificationToken = notificationToken {
            urlRequest.setValue(notificationToken, forHTTPHeaderField: "X-LifeDoc-application-id")
        }

        var localTimeZoneAbbreviation: String { return TimeZone.current.identifier ?? "" }

//        urlRequest.setValue(userAgent, forHTTPHeaderField: "User-Agent")
//        urlRequest.setValue(systemVersion, forHTTPHeaderField: "X-LifeDoc-os")
//        urlRequest.setValue(deviceId, forHTTPHeaderField: "X-LifeDoc-device-id")
//        urlRequest.setValue(deviceName, forHTTPHeaderField: "X-LifeDoc-device-nameMap")
//        urlRequest.setValue(clientVersion, forHTTPHeaderField: "X-LifeDoc-client-version")
//        urlRequest.setValue(appName, forHTTPHeaderField: "X-LifeDoc-app-name")
//        urlRequest.setValue("IOS", forHTTPHeaderField: "X-LifeDoc-os-type")
        urlRequest.setValue(localTimeZoneAbbreviation, forHTTPHeaderField: "the-timezone-iana")
        if let appLanguage: AppLanguage.RawValue = LocalStore().getValue(forKey: .appLanguage) {
            urlRequest.setValue("TRANSLATE_LANGUAGE=" + appLanguage, forHTTPHeaderField: "Cookie")
        }
        
        return urlRequest
    }
}

extension RequestAdapter {
    
    func closeSession() {
        if let adapter = self as? AppRequestAdapter {
            adapter.accessToken = nil
            adapter.refreshToken = nil
            adapter.customerId = nil
        }
    }
}
