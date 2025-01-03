//
//  AccommodationSearchInteractor.swift
//  Ikitabi
//
//  Created by Shotaro Doi on 2024/12/16.
//

import Foundation

final class AccommodationSearchInteractor: AccommodationSearchInteractorProtocol {
    private var accommodationSearchResults: [AccommodationSearchResult] = []
    private let client: APIClient
    private let accommodationStorageService: AccommodationStorageServiceProtocol
    weak var presenter: AccommodationSearchPresenterProtocol?

    init(client: APIClient,
         accommodationStorageService: AccommodationStorageServiceProtocol) {
        self.client = client
        self.accommodationStorageService = accommodationStorageService
    }

    func fetchAccommodationSearchResults(_ text: String?) {
        Task {
            guard let text else { return }
            let request = AccommodationSearchRequest(keyword: text)
            do {
                let result = try await client.send(request: request)
                accommodationSearchResults = processAccommodationSearchResponse(result.hotels)
                presenter?.didFetchAccommodationSearchResults(accommodationSearchResults)
            } catch {
                print(error)
            }
        }
    }

    func getAccommodation(by hotelNo: Int) -> Accommodation? {
        let accommodations = accommodationStorageService.fetchAccommodations(hotelNo: hotelNo)
        if !accommodations.isEmpty {
            return accommodations[0]
        } else {
            return nil
        }
    }

    func saveAccommodationSearchResult(_ result: AccommodationSearchResult,
                                       withMemo memo: String?) {
        let accommodation = Accommodation(name: result.name,
                                          urlString: result.urlString,
                                          evaluation: result.review,
                                          hotelNo: result.hotelNo,
                                          memo: memo)
        accommodationStorageService.insertAccommodation(accommodation)
    }
}

// MARK: - Private functions
private extension AccommodationSearchInteractor {
    func processAccommodationSearchResponse(_ hotels: [HotelResponse]) -> [AccommodationSearchResult] {
        let hotelInfo = hotels.flatMap { $0.hotel.map { $0.hotelBasicInfo } }.compactMap { $0 }
        return hotelInfo.map { .init(review: $0.reviewAverage ?? 0,
                                     urlString: $0.hotelInformationUrl,
                                     imageURLString: $0.hotelImageUrl,
                                     name: $0.hotelName,
                                     hotelNo: $0.hotelNo) }
    }
}
