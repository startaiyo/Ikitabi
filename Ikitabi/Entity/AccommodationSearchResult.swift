//
//  AccommodationSearchResult.swift
//  Ikitabi
//
//  Created by Shotaro Doi on 2024/12/16.
//

import Foundation

struct AccommodationSearchResult: Identifiable, Hashable {
    var id: UUID
    let review: Float
    let urlString: String
    let imageURLString: String
    let name: String
    let hotelNo: Int

    init(review: Float, urlString: String, imageURLString: String, name: String, hotelNo: Int) {
        self.id = UUID()
        self.review = review
        self.urlString = urlString
        self.imageURLString = imageURLString
        self.name = name
        self.hotelNo = hotelNo
    }
}
