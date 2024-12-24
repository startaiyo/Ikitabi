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

    var presenter: AccommodationSearchPresenter?

    init() {
        presenter?.fetchAccommodationSearchResults(nil)
    }

    func displaySearchResults(_ results: [AccommodationSearchResult]) {
        DispatchQueue.main.async {
            self.accommodationSearchResults = results
        }
    }

    func search() {
        print("search by", searchText)
        presenter?.fetchAccommodationSearchResults(searchText.isEmpty ? searchText : nil)
    }
}
