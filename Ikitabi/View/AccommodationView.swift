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
        VStack {
            List {
                ForEach(viewModel.accommodations) { accommodation in
                    Text(accommodation.name)
                }
                .onDelete { indexSet in
                    indexSet.forEach { index in
                        let accommodation = viewModel.accommodations[index]
                        viewModel.deleteAccommodation(accommodation.id)
                    }
                }
            }
            VStack {
                TextField("name", text: $viewModel.newAccommodationName)
                Button {
                    viewModel.addAccommodation()
                } label: {Text("add accommodation")}
            }
        }
    }
}

#Preview {
    AccommodationRouter.createModule()
}
