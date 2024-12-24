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
        let viewModel = AccommodationViewModel()
        let searchViewModel = AccommodationSearchViewModel()
        let view = AccommodationView(viewModel: viewModel)
        let interactor = AccommodationInteractor()
        let presenter = AccommodationPresenter(viewModel: viewModel)
        let router = AccommodationRouter()
        let coordinator = AccommodationCoordinator(router: router, view: view, searchViewModel: searchViewModel)

        viewModel.presenter = presenter
        presenter.interactor = interactor
        interactor.presenter = presenter
        presenter.router = router

        return coordinator
    }

    func navigation(to view: any Hashable) {
        navigationPath.append(view)
    }
}
