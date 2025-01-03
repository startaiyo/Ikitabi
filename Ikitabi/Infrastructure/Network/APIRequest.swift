//
//  APIRequest.swift
//  Ikitabi
//
//  Created by Shotaro Doi on 2024/12/25.
//

import Foundation

enum HTTPMethod: String {
    case connect = "CONNECT"
    case delete = "DELETE"
    case get = "GET"
    case head = "HEAD"
    case options = "OPTIONS"
    case patch = "PATCH"
    case post = "POST"
    case put = "PUT"
    case trace = "TRACE"
}

protocol APIRequest {
    associatedtype Response: Decodable
    
    var baseURL: URL { get }
    var method: HTTPMethod { get }
    var path: String { get }
    var body: String { get }
    var queryItems: [URLQueryItem] { get }

    func buildURLRequest() -> URLRequest
}

extension APIRequest {
    func buildURLRequest() -> URLRequest {
        let url = baseURL.appendingPathComponent(path)

        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)

        switch method {
            case .get:
                components?.queryItems = queryItems
            default:
                fatalError()
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.url = components?.url
        urlRequest.httpMethod = method.rawValue

        return urlRequest
    }

    var baseURL: URL { URL(string: "https://app.rakuten.co.jp/services/api")! }
}
