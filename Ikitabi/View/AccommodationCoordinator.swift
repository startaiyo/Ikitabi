//
//  AccommodationCoordinator.swift
//  Ikitabi
//
//  Created by Shotaro Doi on 2024/12/10.
//

import SwiftUI

enum AccommodationDestination: Hashable {
    case search
}

struct AccommodationCoordinator: View {
    @StateObject var router: AccommodationRouter
    var view: AccommodationView?
    var searchViewModel: AccommodationSearchViewModel

    var body: some View {
        NavigationStack(path: $router.navigationPath) {
            view
                .navigationDestination(for: AccommodationDestination.self) { destination in
                    switch destination {
                        case .search:
                            AccommodationSearchView(viewModel: searchViewModel)
                    }
                }
        }
    }
}
