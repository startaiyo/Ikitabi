//
//  AccommodationPresenter.swift
//  Ikitabi
//
//  Created by Shotaro Doi on 2024/12/10.
//

import Foundation

final class AccommodationPresenter: AccommodationPresenterProtocol {
    weak var viewModel: AccommodationViewModelProtocol?
    var interactor: AccommodationInteractorProtocol?
    var router: (any AccommodationRouterProtocol)?

    init(viewModel: AccommodationViewModelProtocol) {
        self.viewModel = viewModel
    }

    func fetchAccommodations() {
        interactor?.fetchAccommodations()
    }

    func deleteAccommodation(_ uuid: UUID) {
        interactor?.deleteAccommodation(uuid)
    }

    func didFetchAccommodations(_ accommodations: [Accommodation]) {
        viewModel?.displayAccommodations(accommodations)
    }

    func didAddAccommodation() {
        interactor?.fetchAccommodations()
    }

    func didDeleteAccommodation() {
        interactor?.fetchAccommodations()
    }

    func showAccommodationSearchScreen() {
        router?.navigation(to: AccommodationDestination.search)
    }
}
