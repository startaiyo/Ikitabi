//
//  AccommodationSearchRequest.swift
//  Ikitabi
//
//  Created by Shotaro Doi on 2024/12/25.
//

import Foundation

struct AccommodationSearchRequest: APIRequest {
    typealias Response = AccommodationSearchResponse

    var path: String = "Travel/KeywordHotelSearch/20170426"
    var method: HTTPMethod = .get
    var body: String = ""
    var queryItems: [URLQueryItem] = [.init(name: "format", value: "json"),
                                      .init(name: "applicationId", value: "1014062845500320136")]

    init(keyword: String) {
        queryItems.append(contentsOf: [.init(name: "keyword", value: keyword)])
    }
}

struct AccommodationSearchResponse: Codable {
    let hotels: [HotelResponse]
}

struct HotelResponse: Codable {
    let hotel: [HotelInfo]
}

struct HotelInfo: Codable {
    let hotelBasicInfo: HotelBasicInfo?
}

struct HotelBasicInfo: Codable {
    let hotelName: String
    let hotelInformationUrl: String
    let hotelImageUrl: String
    let hotelNo: Int
    let reviewAverage: Float?
}
