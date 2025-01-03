//
//  AccommodationStorageServiceProtocol.swift
//  Ikitabi
//
//  Created by Shotaro Doi on 2024/12/31.
//

protocol AccommodationStorageServiceProtocol {
    func fetchAccommodations(hotelNo: Int?) -> [Accommodation]
    func insertAccommodation(_ accommodation: Accommodation)
    func deleteAccommodation(_ accommodation: Accommodation)
    func updateAccommodation()
}
