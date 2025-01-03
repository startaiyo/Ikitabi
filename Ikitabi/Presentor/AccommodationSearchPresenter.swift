//
//  AccommodationSearchPresenter.swift
//  Ikitabi
//
//  Created by Shotaro Doi on 2024/12/16.
//

import Foundation
final class AccommodationSearchPresenter: AccommodationSearchPresenterProtocol {
    weak var viewModel: AccommodationSearchViewModelProtocol?
    var interactor: AccommodationSearchInteractorProtocol?
    var router: (any AccommodationRouterProtocol)?

    init(viewModel: AccommodationSearchViewModelProtocol) {
        self.viewModel = viewModel
    }

    func fetchAccommodationSearchResults(_ text: String?) {
        interactor?.fetchAccommodationSearchResults(text)
    }

    func didFetchAccommodationSearchResults(_ accommodationSearchResults: [AccommodationSearchResult]) {
        viewModel?.displaySearchResults(accommodationSearchResults)
    }

    func showAccommodationSearchDetail(_ result: AccommodationSearchResult) {
        let searchDetailViewModel = AccommodationSearchDetailViewModel(accommodationSearchResult: result,
                                                                       isSaved: interactor?.getAccommodation(by: result.hotelNo) != nil,
                                                                       onSaveButtonTapped: { [weak self] result, memo in
            self?.saveAccommodationSearchResult(result,
                                                withMemo: memo)
        })
        router?.navigation(to: AccommodationDestination.searchDetail(searchDetailViewModel))
    }
}

// MARK: - Private funcions
private extension AccommodationSearchPresenter {
    func saveAccommodationSearchResult(_ result: AccommodationSearchResult,
                                       withMemo memo: String?) {
        interactor?.saveAccommodationSearchResult(result,
                                                  withMemo: memo)
        router?.back()
    }
}
