//
//  AccommodationInteractor.swift
//  Ikitabi
//
//  Created by Shotaro Doi on 2024/12/08.
//

import Foundation

final class AccommodationInteractor: AccommodationInteractorProtocol {
    private let accommodationStorage: AccommodationStorageServiceProtocol
    private var accommodations: [Accommodation] = []
    weak var presenter: AccommodationPresenterProtocol?

    init(accommodationStorage: AccommodationStorageServiceProtocol) {
        self.accommodationStorage = accommodationStorage
    }

    func fetchAccommodations() {
        accommodations = accommodationStorage.fetchAccommodations(hotelNo: nil)
        presenter?.didFetchAccommodations(accommodations)
    }

    func deleteAccommodation(_ uuid: UUID) {
        let accommodationToDelete = accommodations.first { $0.id == uuid }
        if let accommodationToDelete {
            accommodationStorage.deleteAccommodation(accommodationToDelete)
        }
        presenter?.didDeleteAccommodation()
    }

    func updateAccommodation() {
        accommodationStorage.updateAccommodation()
    }
}
