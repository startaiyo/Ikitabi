//
//  APIClient.swift
//  Ikitabi
//
//  Created by Shotaro Doi on 2024/12/25.
//

import Foundation

struct APIClient {
    private let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()
    
    private let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
    
    public init() {}
    
    public func send<Request: APIRequest>(request: Request) async throws -> Request.Response {
        
        let result = try await session.data(for: request.buildURLRequest())
        print(request.buildURLRequest())
        try validate(data: result.0, response: result.1)
        return try decoder.decode(Request.Response.self, from: result.0)
    }
    
    func validate(data: Data, response: URLResponse) throws {
    }
}
