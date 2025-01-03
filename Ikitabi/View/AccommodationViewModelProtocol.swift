//
//  AccommodationViewModelProtocol.swift
//  Ikitabi
//
//  Created by Shotaro Doi on 2024/12/08.
//

import Foundation

protocol AccommodationViewModelProtocol: AnyObject {
    func displayAccommodations(_ accommodations: [Accommodation])
    func fetchAccommodations()
    func deleteAccommodation(_ uuid: UUID)
    func updateAccommodation()
}
