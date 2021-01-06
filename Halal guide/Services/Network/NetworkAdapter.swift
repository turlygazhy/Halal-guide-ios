//
//  NetworkAdapter.swift
//  Halal guide
//
//  Created by Bagdat Zhunisbekov on 06.01.2021.
//  Copyright © 2021 Halaldamu. All rights reserved.
//

import Alamofire
import SystemConfiguration

final class NetworkAdapter: NetworkService {
        
    let sessionManager: AppSessionManager
    
    init(sessionManager: AppSessionManager) {
        self.sessionManager = sessionManager
    }
    
    @discardableResult
    func load(context: NetworkContext, completion: @escaping (NetworkResponse) -> Void) -> CancelableRequest? {
        guard networkConnectionStatus != .notAvailable else {
            completion(FailureNetworkResponse(networkError: .noConnection))
            return nil
        }
        
        let dataRequest: DataRequest
        if let httpBody = context.httpBody {
            guard var urlRequest = try? URLRequest(
                url: context.urlString,
                method: converHttpMethod(from: context.method)
            ) else {
                completion(FailureNetworkResponse(networkError: .unknown))
                return nil
            }
            
            urlRequest.httpBody = httpBody
            urlRequest.setValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-Type")
            context.headers.forEach { urlRequest.setValue($1, forHTTPHeaderField: $0) }
            dataRequest = sessionManager.request(urlRequest)

        } else {
            dataRequest = sessionManager.request(
                context.urlString,
                method: converHttpMethod(from: context.method),
                parameters: context.parameters,
                encoding: convertEncoding(from: context.encoding),
                headers: context.headers
            )
        }
        
        dataRequest.validate().responseData { [weak self] serverResponse in
            guard let networkAdapter = self else { return }
            networkAdapter.log(serverResponse: serverResponse)
            
            guard let response = serverResponse.response else {
                if let error = serverResponse.error, (error as NSError).code == -999 {
                    completion(FailureNetworkResponse(networkError: .cancelled))
                } else {
                    completion(FailureNetworkResponse(networkError: .unknown))
                }
                return
            }
            
            guard response.statusCode != 401 else {
                if response.url?.absoluteString == Constants.baseURL+"/auth/login" {
                     completion(FailureNetworkResponse(networkError: .noUser))
                } else {
                    networkAdapter.sessionManager.requestAccessToken(networkAdapter: networkAdapter) { [weak self] result in
                        switch result {
                        case .success: self?.load(context: context, completion: completion)
                        case .error: completion(serverResponse)
                        }
                    }
                }
                return
            }
            
            
            
            completion(serverResponse)
        }
        
        return getIdentifiedRequest(from: dataRequest)
    }
    
    func load<T: Decodable>(context: NetworkContext, completion: @escaping (_ result: Result<T>) -> Void) {
        load(context: context) { serverResponse in
            guard serverResponse.isSuccess else {
                completion(.error(serverResponse.networkError ?? .unknown))
                return
            }
            
            guard let item: T = serverResponse.decode() else {
                completion(.error(NetworkError.dataLoad))
                return
            }
            
            completion(.success(item))
        }
    }
    
    func load(
        context: MultipartFormDataNetworkContext,
        onCompletion pass: @escaping (_ networkResponse: NetworkResponse) -> Void
    ) {
        guard networkConnectionStatus != .notAvailable else {
            pass(FailureNetworkResponse(networkError: .noConnection))
            return
        }
        
        sessionManager.upload(
            multipartFormData: { multipartFormData in
                for (key, value) in context.parameters {
                    if let value = value as? CustomStringConvertible,
                       let data = value.description.data(using: .utf8) {
                        multipartFormData.append(data, withName: key)
                    }
                }
                
                context.paramsArray.forEach { multipartFormDataParams in
                    multipartFormData.append(
                        multipartFormDataParams.data,
                        withName: multipartFormDataParams.name,
                        fileName: multipartFormDataParams.fileName,
                        mimeType: multipartFormDataParams.mimeType
                    )
                }
            },
            to: context.urlString,
            method: converHttpMethod(from: context.method),
            headers: context.headers,
            encodingCompletion: { [weak self] result in
                switch result {
                case .success(let request, _, _):
                    request.validate().responseData { [weak self] dataResponse in
                        guard let networkAdapter = self else { return }
                        networkAdapter.log(serverResponse: dataResponse)
                        pass(dataResponse)
                    }
                case .failure(let error):
                    let networkError = NetworkError.serverError(description: error.localizedDescription)
                    pass(FailureNetworkResponse(networkError: networkError))
                }
            }
        )
    }
    
    @discardableResult
    func download(
        context: NetworkContext,
        nameOfFile: String,
        completion: @escaping (_ networkResponse: NetworkResponse) -> Void
    ) -> CancelableRequest? {
        guard networkConnectionStatus != .notAvailable else {
            completion(FailureNetworkResponse(networkError: .noConnection))
            return nil
        }
        
        let destination: DownloadRequest.DownloadFileDestination = { _, _ in
            var documentsURL = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)[0]
            documentsURL.appendPathComponent(nameOfFile)
            return (documentsURL, [.removePreviousFile, .createIntermediateDirectories])
        }
        let request = sessionManager.download(
            context.urlString,
            method: converHttpMethod(from: context.method),
            parameters: context.parameters,
            encoding: convertEncoding(from: context.encoding),
            headers: context.headers,
            to: destination
        )
        
        request.validate().responseData { [weak self] downloadResponse in
            guard let networkAdapter = self else { return }
            networkAdapter.log(serverResponse: downloadResponse)
            guard let response = downloadResponse.response else {
                if let error = downloadResponse.error, (error as NSError).code == -999 {
                    completion(FailureNetworkResponse(networkError: .cancelled))
                } else {
                    completion(FailureNetworkResponse(networkError: .unknown))
                }
                return
            }
            
            guard response.statusCode != 401 else {
                return
            }
            
            completion(downloadResponse)
        }
        
        return getIdentifiedRequest(from: request)
    }
    
    func log(serverResponse: LoggableResponse) {
        let emoji: String
        let statusCode = serverResponse.response?.statusCode
        if let statusCode = statusCode, 200..<300 ~= statusCode {
            emoji = "✅"
        } else {
            emoji = "⚠️"
        }
        
        print("\n======== REQUEST BEGIN " + emoji + " ========")
        if let request = serverResponse.request {
            if let method = request.httpMethod,
               let url = request.url {
                print("URL:")
                print(method + " " + url.absoluteString)
            }
            if let headerFields = request.allHTTPHeaderFields,
               let data = try? JSONSerialization.data(withJSONObject: headerFields, options: [.prettyPrinted]),
               let string = String(data: data, encoding: .utf8) {
                print("HEADERS:")
                print(string)
            }
            if let string = request.httpBody?.jsonString {
                print("REQUEST BODY:")
                print(string)
            }
        }
        if let string = serverResponse.data?.jsonString {
            print("RESPONSE BODY:")
            print(string)
        }
        if let statusCode = statusCode {
            print("STATUS CODE: " + statusCode.description)
        }
        if let error = serverResponse.error {
            print("ERROR:")
            print(error.localizedDescription)
        }
        print("======== REQUEST END " + emoji + " ========\n")
    }
    
    private func getIdentifiedRequest(from request: Request) -> IdentifiedRequest {
        let uuid = UUID()
        let identifiedRequest = IdentifiedRequest(identifier: uuid, request: request)
        return identifiedRequest
    }
    
    private func converHttpMethod(from networkMethod: NetworkMethod) -> HTTPMethod {
        switch networkMethod {
        case .get:
            return .get
        case .post:
            return .post
        case .put:
            return .put
        case .patch:
            return .patch
        case .delete:
            return .delete
        }
    }
    
    private func convertEncoding(from networkEncoding: NetworkEncoding) -> ParameterEncoding {
        switch networkEncoding {
        case .json:
            return JSONEncoding.default
        case .url:
            return URLEncoding.default
        }
    }
    
    /// Network connection states
    private enum NetworkConnectionStatus { case notAvailable, availableViaWWAN, availableViaWiFi }
    
    /// Get network connection status
    private var networkConnectionStatus: NetworkConnectionStatus {
        
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout<sockaddr_in>.size)
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {
                SCNetworkReachabilityCreateWithAddress(nil, $0)
            }
        }
        guard let target = defaultRouteReachability else { return .notAvailable }
        
        var flags: SCNetworkReachabilityFlags = []
        if !SCNetworkReachabilityGetFlags(target, &flags) { return .notAvailable }
        
        /* The target host is not reachable: */
        if !flags.contains(.reachable) { return .notAvailable }
        /* WWAN connections are OK if the calling application is using the CFNetwork APIs: */
        else if flags.contains(.isWWAN) { return .availableViaWWAN }
        /* If the target host is reachable and no connection is required then we'll assume that you're on Wi-Fi: */
        else if !flags.contains(.connectionRequired) { return .availableViaWiFi }
        /* The connection is on-demand (or on-traffic) if the calling application is
           using the CFSocketStream or higher APIs and no [user] intervention is needed: */
        else if (flags.contains(.connectionOnDemand) || flags.contains(.connectionOnTraffic)) &&
                !flags.contains(.interventionRequired) { return .availableViaWiFi }
        /* else: */
        else { return .notAvailable }
    }
}

extension DataResponse: NetworkResponse {
    var isSuccess: Bool {
        return result.isSuccess
    }
    
    var networkError: NetworkError? {
        guard let error = error, let alamofireError = error as? AFError else {
            return nil
        }
        
        if alamofireError.responseCode == 401 {
            return .unauthorized
        }
        
        let description = json?["description"] as? String ?? json?["message"] as? String ?? json?["value"] as? String
        return .serverError(description: description ?? alamofireError.localizedDescription)
    }
}

extension DownloadResponse: NetworkResponse {
    var data: Data? {
        return nil
    }
    
    var isSuccess: Bool {
        return result.isSuccess
    }
    
    var networkError: NetworkError? {
        guard let error = error, let alamofireError = error as? AFError else {
            return nil
        }
        
        if alamofireError.responseCode == 401 {
            return .unauthorized
        }
        
        let description = json?["description"] as? String ?? json?["value"] as? String
        return .serverError(description: description ?? alamofireError.localizedDescription)
    }
}

extension DataResponse: LoggableResponse { }

extension DownloadResponse: LoggableResponse { }
