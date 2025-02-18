//
//  AccommodationPresenterProtocol.swift
//  Ikitabi
//
//  Created by Shotaro Doi on 2024/12/08.
//

import Foundation

protocol AccommodationPresenterProtocol: AnyObject {
    func didFetchAccommodations(_ accommodations: [Accommodation])
    func didAddAccommodation()
    func didDeleteAccommodation()
}

final class AccommodationPresenter: AccommodationPresenterProtocol {
    weak var viewModel: AccommodationViewModelProtocol?
    var interactor: AccommodationInteractorProtocol?

    init(viewModel: AccommodationViewModelProtocol) {
        self.viewModel = viewModel
    }

    func fetchAccommodations() {
        interactor?.fetchAccommodations()
    }

    func addAccommodation(name: String, urlString: String, evaluation: Float) {
        interactor?.addAccommodation(name: name, urlString: urlString, evaluation: evaluation)
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
}
