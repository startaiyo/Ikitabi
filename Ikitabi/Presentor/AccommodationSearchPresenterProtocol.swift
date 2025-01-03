//
//  AccommodationSearchPresenterProtocol.swift
//  Ikitabi
//
//  Created by Shotaro Doi on 2024/12/16.
//

import Foundation

protocol AccommodationSearchPresenterProtocol: AnyObject {
    func fetchAccommodationSearchResults(_ text: String?)
    func didFetchAccommodationSearchResults(_ accommodationSearchResults: [AccommodationSearchResult])
    func showAccommodationSearchDetail(_ result: AccommodationSearchResult)
}
