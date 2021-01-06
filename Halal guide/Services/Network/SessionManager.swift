//
//  SessionManager.swift
//  Halal guide
//
//  Created by Bagdat Zhunisbekov on 06.01.2021.
//  Copyright © 2021 Halaldamu. All rights reserved.
//

import Alamofire

let sessionManager: AppSessionManager = {
    
    func getServerTrustPolicyManager() -> ServerTrustPolicyManager? {
        let policies = [Constants.host: ServerTrustPolicy.disableEvaluation]
        let serverTrustPolicyManager = ServerTrustPolicyManager(policies: policies)
        return serverTrustPolicyManager
    }
    
    let configuration = URLSessionConfiguration.default
    let serverTrustPolicyManager = getServerTrustPolicyManager()
    let sessionManager = AppSessionManager(
        configuration: configuration,
        serverTrustPolicyManager: serverTrustPolicyManager
    )
    
    sessionManager.delegate.dataTaskDidReceiveResponse = { [weak sessionManager] _, _, response in
                  
         return .allow
    }
     

    sessionManager.adapter = AppRequestAdapter()    
    return sessionManager
}()
