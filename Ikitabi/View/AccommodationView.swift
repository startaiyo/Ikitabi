//
//  AccommodationView.swift
//  Ikitabi
//
//  Created by Shotaro Doi on 2024/12/08.
//

import SwiftUI

struct AccommodationView: View {
    @ObservedObject var viewModel: AccommodationViewModel

    var body: some View {
        NavigationView {
            VStack {
                if viewModel.accommodations.isEmpty {
                    VStack(spacing: 16) {
                        Text("empty result")
                            .font(.title)
                            .foregroundColor(.gray)
                        Text("please search the hotels with the search button")
                            .font(.body)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                    }
                    .padding()
                } else {
                    List {
                        ForEach(viewModel.accommodations) { accommodation in
                            VStack(alignment: .leading, spacing: 4) {
                                Link(accommodation.name,
                                     destination: URL(string: accommodation.urlString)!)
                                .font(.headline)
                                if let memo = accommodation.memo {
                                    Text("メモ: \(memo)")
                                        .font(.system(size: 15))
                                        .foregroundColor(.gray)
                                }
                            }
                        }
                        .onDelete { indexSet in
                            indexSet.forEach { index in
                                let accommodation = viewModel.accommodations[index]
                                viewModel.deleteAccommodation(accommodation.id)
                            }
                        }
                    }
                }
            }
            .toolbar {
                Button("search") {
                    viewModel.showAccommodationSearch()
                }
            }
            .navigationTitle("Want to visit")
            .onAppear {
                viewModel.fetchAccommodations()
            }
        }
    }
}

#Preview {
    AccommodationRouter.createModule()
}
