//
//  AccommodationSearchPresenter.swift
//  Ikitabi
//
//  Created by Shotaro Doi on 2024/12/16.
//

final class AccommodationSearchPresenter: AccommodationSearchPresenterProtocol {
    weak var viewModel: AccommodationSearchViewModelProtocol?
    var interactor: AccommodationInteractorProtocol?
    var router: (any AccommodationRouterProtocol)?

    init(viewModel: AccommodationSearchViewModelProtocol) {
        self.viewModel = viewModel
    }

    func fetchAccommodationSearchResults(_ text: String?) {
        interactor?.fetchAccommodations()
    }
}
