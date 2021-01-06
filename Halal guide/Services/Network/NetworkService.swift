//
//  NetworkService.swift
//  Halal guide
//
//  Created by Bagdat Zhunisbekov on 06.01.2021.
//  Copyright © 2021 Halaldamu. All rights reserved.
//

import Foundation
import Alamofire

protocol NetworkService {
    @discardableResult
    func load(context: NetworkContext, completion: @escaping (NetworkResponse) -> Void) -> CancelableRequest?
    func load<T: Decodable>(context: NetworkContext, completion: @escaping (_ result: Result<T>) -> Void)
    func load(
        context: MultipartFormDataNetworkContext,
        onCompletion pass: @escaping (_ networkResponse: NetworkResponse) -> Void
    )
    func download(
        context: NetworkContext,
        nameOfFile: String,
        completion: @escaping (NetworkResponse) -> Void
    ) -> CancelableRequest?
}
