//
//  AccommodationSearchResult.swift
//  Ikitabi
//
//  Created by Shotaro Doi on 2024/12/16.
//

import Foundation

struct AccommodationSearchResult: Identifiable {
    var id: UUID
    let review: Float
    let urlString: String
    let name: String

    init(review: Float, urlString: String, name: String) {
        self.id = UUID()
        self.review = review
        self.urlString = urlString
        self.name = name
    }
}
