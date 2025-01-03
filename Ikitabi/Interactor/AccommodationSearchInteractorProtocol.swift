//
//  AccommodationSearchInteractorProtocol.swift
//  Ikitabi
//
//  Created by Shotaro Doi on 2024/12/16.
//

protocol AccommodationSearchInteractorProtocol: AnyObject {
    func fetchAccommodationSearchResults(_ text: String?)
    func getAccommodation(by hotelNo: Int) -> Accommodation?
    func saveAccommodationSearchResult(_ result: AccommodationSearchResult,
                                       withMemo: String?)
}
