//
//  AccommodationInteractor.swift
//  Ikitabi
//
//  Created by Shotaro Doi on 2024/12/08.
//

import Foundation

final class AccommodationInteractor: AccommodationInteractorProtocol {
    private var accommodations: [Accommodation] = []
    weak var presenter: AccommodationPresenterProtocol?

    func fetchAccommodations() {
        presenter?.didFetchAccommodations(accommodations)
    }

    func addAccommodation(name: String, urlString: String, evaluation: Float) {
        let accommodation = Accommodation(name: name, urlString: urlString, evaluation: evaluation)
        accommodations.append(accommodation)
        presenter?.didAddAccommodation()
    }

    func deleteAccommodation(_ uuid: UUID) {
        accommodations.removeAll { $0.id == uuid }
        presenter?.didDeleteAccommodation()
    }
}
