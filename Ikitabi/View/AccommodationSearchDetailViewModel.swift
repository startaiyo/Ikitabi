//
//  AccommodationSearchDetailViewModel.swift
//  Ikitabi
//
//  Created by Shotaro Doi on 2025/01/01.
//

import SwiftUI

final class AccommodationSearchDetailViewModel: ObservableObject, AccommodationSearchDetailViewModelProtocol {
    @Published var accommodationSearchResult: AccommodationSearchResult
    @Published var currentMemo: String = ""
    @State var isSaved = false
    let onSaveButtonTapped: (AccommodationSearchResult, String?) -> Void

    init(accommodationSearchResult: AccommodationSearchResult,
         isSaved: Bool,
         onSaveButtonTapped: @escaping (AccommodationSearchResult, String?) -> Void) {
        self.accommodationSearchResult = accommodationSearchResult
        self.isSaved = isSaved
        self.onSaveButtonTapped = onSaveButtonTapped
    }

    func handleSaveButtonTapped() {
        onSaveButtonTapped(accommodationSearchResult, currentMemo.isEmpty ? nil : currentMemo)
    }
}

// MARK: - Hashable
extension AccommodationSearchDetailViewModel: Hashable {
    static func == (lhs: AccommodationSearchDetailViewModel,
                    rhs: AccommodationSearchDetailViewModel) -> Bool {
        return lhs.accommodationSearchResult == rhs.accommodationSearchResult
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(accommodationSearchResult)
    }
}
