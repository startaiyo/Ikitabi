//
//  AccommodationPresenterProtocol.swift
//  Ikitabi
//
//  Created by Shotaro Doi on 2024/12/08.
//

import Foundation

protocol AccommodationPresenterProtocol: AnyObject {
    func fetchAccommodations()
    func addAccommodation(name: String, urlString: String, evaluation: Float)
    func deleteAccommodation(_ uuid: UUID)
    func didFetchAccommodations(_ accommodations: [Accommodation])
    func didAddAccommodation()
    func didDeleteAccommodation()
    func showAccommodationSearchScreen()
}
