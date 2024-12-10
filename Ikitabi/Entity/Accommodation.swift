//
//  Accommodation.swift
//  Ikitabi
//
//  Created by Shotaro Doi on 2024/12/08.
//

import Foundation

struct Accommodation: Identifiable {
    let id: UUID
    let name: String
    let urlString: String
    let evaluation: Float

    init(id: UUID = UUID(), name: String, urlString: String, evaluation: Float) {
        self.id = id
        self.name = name
        self.urlString = urlString
        self.evaluation = evaluation
    }
}
