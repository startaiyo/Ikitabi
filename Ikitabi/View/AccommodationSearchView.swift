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
        List {
            if viewModel.accommodationSearchResults.isEmpty {
                Text("データがありません。施設名等で検索してください。")
                    .font(.headline)
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            } else {
                ForEach(viewModel.accommodationSearchResults) { result in
                    Button {
                        viewModel.showAccommodationSearchDetail(result)
                    } label: {
                        Text(result.name)
                    }
                }
            }
        }
        .searchable(text: $viewModel.searchText)
        .onSubmit(of: .search) {
            viewModel.search()
        }
    }
}
