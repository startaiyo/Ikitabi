//
//  AccommodationViewModel.swift
//  Ikitabi
//
//  Created by Shotaro Doi on 2024/12/08.
//

import SwiftUI

final class AccommodationViewModel: ObservableObject, AccommodationViewModelProtocol {
    @Published var accommodations: [Accommodation] = []

    var presenter: AccommodationPresenter?

    func displayAccommodations(_ accommodations: [Accommodation]) {
        DispatchQueue.main.async {
            self.accommodations = accommodations
        }
    }

    func fetchAccommodations() {
        presenter?.fetchAccommodations()
    }

    func deleteAccommodation(_ uuid: UUID) {
        presenter?.deleteAccommodation(uuid)
    }

    func showAccommodationSearch() {
        presenter?.showAccommodationSearchScreen()
    }

    func updateAccommodation() {
        presenter?.updateAccommodation()
    }
}
