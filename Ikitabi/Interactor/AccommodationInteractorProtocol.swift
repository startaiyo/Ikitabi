//
//  AccommodationInteractorProtocol.swift
//  Ikitabi
//
//  Created by Shotaro Doi on 2024/12/08.
//

import Foundation

protocol AccommodationInteractorProtocol: AnyObject {
    func fetchAccommodations()
    func deleteAccommodation(_ uuid: UUID)
    func updateAccommodation()
}
