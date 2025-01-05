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
        ZStack {
            List {
                if viewModel.accommodationSearchResults.isEmpty {
                    VStack {
                        Text("EMPTY_ACCOMMODATION_SEARCH_RESULT_DESCRIPTION")
                            .font(.headline)
                            .foregroundColor(.gray)
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    }
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
            .searchable(text: $viewModel.searchText, placement: .navigationBarDrawer(displayMode: .always))
            .onSubmit(of: .search) {
                viewModel.search()
            }
            if viewModel.isLoading {
                Color.gray.opacity(0.4)
                    .edgesIgnoringSafeArea(.all)
                ProgressView()
                    .scaleEffect(1.5)
            }
        }
    }
}
