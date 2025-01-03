//
//  AccommodationSearchViewModel.swift
//  Ikitabi
//
//  Created by Shotaro Doi on 2024/12/16.
//

import SwiftUI

final class AccommodationSearchViewModel: ObservableObject, AccommodationSearchViewModelProtocol {
    @Published var accommodationSearchResults: [AccommodationSearchResult] = []
    var searchText: String = ""

    var presenter: AccommodationSearchPresenterProtocol?

    init() {
        presenter?.fetchAccommodationSearchResults(nil)
    }

    func displaySearchResults(_ results: [AccommodationSearchResult]) {
        DispatchQueue.main.async {
            self.accommodationSearchResults = results
        }
    }

    func search() {
        presenter?.fetchAccommodationSearchResults(searchText.isEmpty ? nil : searchText)
    }

    func showAccommodationSearchDetail(_ result: AccommodationSearchResult) {
        presenter?.showAccommodationSearchDetail(result)
    }
}
