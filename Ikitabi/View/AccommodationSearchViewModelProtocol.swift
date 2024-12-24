//
//  AccommodationSearchViewModelProtocol.swift
//  Ikitabi
//
//  Created by Shotaro Doi on 2024/12/16.
//

import Foundation

protocol AccommodationSearchViewModelProtocol: AnyObject {
    func displaySearchResults(_ results: [AccommodationSearchResult])
    func search()
}

