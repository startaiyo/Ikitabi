//
//  AccommodationRouter.swift
//  Ikitabi
//
//  Created by Shotaro Doi on 2024/12/08.
//

import SwiftUI

final class AccommodationRouter: AccommodationRouterProtocol {
    static func createModule() -> some View {
        let viewModel = AccommodationViewModel()
        let view = AccommodationView(viewModel: viewModel)
        let interactor = AccommodationInteractor()
        let presenter = AccommodationPresenter(viewModel: viewModel)

        viewModel.presenter = presenter
        presenter.interactor = interactor
        interactor.presenter = presenter

        return view
    }
}
