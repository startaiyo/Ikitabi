//
//  AccommodationSearchViewModel.swift
//  Ikitabi
//
//  Created by Shotaro Doi on 2024/12/16.
//

import SwiftUI

final class AccommodationSearchViewModel: ObservableObject, AccommodationSearchViewModelProtocol {
    @Published var accommodationSearchResults: [AccommodationSearchResult] = []
    @Published var isLoading = false
    var searchText: String = ""

    var presenter: AccommodationSearchPresenterProtocol?

    init() {
        presenter?.fetchAccommodationSearchResults(nil)
    }

    func displaySearchResults(_ results: [AccommodationSearchResult]) {
        DispatchQueue.main.async { [weak self] in
            self?.accommodationSearchResults = results
            self?.isLoading = false
        }
    }

    func search() {
        presenter?.fetchAccommodationSearchResults(searchText.isEmpty ? nil : searchText)
        isLoading = true
    }

    func showAccommodationSearchDetail(_ result: AccommodationSearchResult) {
        presenter?.showAccommodationSearchDetail(result)
    }
}
