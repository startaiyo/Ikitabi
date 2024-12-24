//
//  AccommodationSearchInteractor.swift
//  Ikitabi
//
//  Created by Shotaro Doi on 2024/12/16.
//

import Foundation

final class AccommodationSearchInteractor: AccommodationSearchInteractorProtocol {
    private var accommodationSearchResults: [AccommodationSearchResult] = []
    weak var presenter: AccommodationSearchPresenter?

    func fetchAccommodationSearchResults(_ text: String?) {
        accommodationSearchResults = []
    }
}
