//
//  AccommodationRouter.swift
//  Ikitabi
//
//  Created by Shotaro Doi on 2024/12/08.
//

import SwiftUI

final class AccommodationRouter: AccommodationRouterProtocol, ObservableObject {
    @Published var navigationPath = NavigationPath()

    static func createModule() -> some View {
        let apiClient = APIClient()
        let storageService = AccommodationStorageService()

        let viewModel = AccommodationViewModel()
        let searchViewModel = AccommodationSearchViewModel()
        let view = AccommodationView(viewModel: viewModel)
        let interactor = AccommodationInteractor(accommodationStorage: storageService)
        let searchInteractor = AccommodationSearchInteractor(client: apiClient,
                                                             accommodationStorageService: storageService)
        let presenter = AccommodationPresenter(viewModel: viewModel)
        let searchPresenter = AccommodationSearchPresenter(viewModel: searchViewModel)
        let router = AccommodationRouter()
        let coordinator = AccommodationCoordinator(router: router, view: view, searchViewModel: searchViewModel)

        presenter.interactor = interactor
        searchPresenter.interactor = searchInteractor
        interactor.presenter = presenter
        searchInteractor.presenter = searchPresenter
        viewModel.presenter = presenter
        searchViewModel.presenter = searchPresenter
        presenter.router = router
        searchPresenter.router = router

        return coordinator
    }

    func navigation(to view: any Hashable) {
        navigationPath.append(view)
    }

    func back() {
        navigationPath.removeLast()
    }
}
