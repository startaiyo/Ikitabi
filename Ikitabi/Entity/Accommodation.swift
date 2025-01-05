//
//  Accommodation.swift
//  Ikitabi
//
//  Created by Shotaro Doi on 2024/12/08.
//

import Foundation
import SwiftData

// When the migration is needed, please refer this: https://ramble.impl.co.jp/7181/
@Model
final class Accommodation: Identifiable {
    var id: UUID
    var name: String
    var urlString: String
    var evaluation: Float
    var hotelNo: Int
    var memo: String?

    init(id: UUID = UUID(), name: String, urlString: String, evaluation: Float, hotelNo: Int, memo: String?) {
        self.id = id
        self.name = name
        self.urlString = urlString
        self.evaluation = evaluation
        self.hotelNo = hotelNo
        self.memo = memo
    }
}
