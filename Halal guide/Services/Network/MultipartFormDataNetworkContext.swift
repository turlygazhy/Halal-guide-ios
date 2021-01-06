import Foundation

typealias MultipartFormDataParams = (data: Data, name: String, fileName: String, mimeType: String)

protocol MultipartFormDataNetworkContext: NetworkContext {
    var paramsArray: [MultipartFormDataParams] { get }
    init(paramsArray: [MultipartFormDataParams])
}
