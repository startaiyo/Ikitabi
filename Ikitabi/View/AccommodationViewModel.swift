//
//  AccommodationViewModel.swift
//  Ikitabi
//
//  Created by Shotaro Doi on 2024/12/08.
//

import SwiftUI

final class AccommodationViewModel: ObservableObject, AccommodationViewModelProtocol {
    @Published var accommodations: [Accommodation] = []
    @Published var newAccommodationName: String = ""
    @Published var newAccommodationURLString: String = ""
    @Published var newAccommodationEvaluation: Float = 0

    var presenter: AccommodationPresenter?

    init() {
        presenter?.fetchAccommodations()
    }

    func displayAccommodations(_ accommodations: [Accommodation]) {
        DispatchQueue.main.async {
            self.accommodations = accommodations
        }
    }

    func addAccommodation() {
        presenter?.addAccommodation(name: newAccommodationName, urlString: newAccommodationURLString, evaluation: newAccommodationEvaluation)
    }

    func deleteAccommodation(_ uuid: UUID) {
        presenter?.deleteAccommodation(uuid)
    }

    func showAccommodationSearch() {
        presenter?.showAccommodationSearchScreen()
    }
}
