//
//  AccommodationSearchView.swift
//  Ikitabi
//
//  Created by Shotaro Doi on 2024/12/10.
//

import SwiftUI

struct AccommodationSearchView: View {
    @ObservedObject var viewModel: AccommodationSearchViewModel

    var body: some View {
        VStack {
            List {
                ForEach(viewModel.accommodationSearchResults) { result in
                    Text(result.name)
                }
            }
            .searchable(text: $viewModel.searchText)
            .onSubmit(of: .search) {
                viewModel.search()
            }
        }
    }
}
