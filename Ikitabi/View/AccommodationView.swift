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
                        Text("EMPTY_ACCOMMODATION_TITLE")
                            .font(.title)
                            .foregroundColor(.gray)
                        Text("EMPTY_ACCOMMODATION_DESCRIPTION")
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
                                Text(accommodation.name)
                                    .font(.headline)
                                    .foregroundColor(viewModel.editMode == .active ? .black : .blue)

                                if let memo = accommodation.memo {
                                    Text(String(format: NSLocalizedString("MEMO_LABEL", comment: "memo label"), memo))
                                        .font(.system(size: 15))
                                        .foregroundColor(.gray)
                                }
                            }
                            .onTapGesture {
                                if viewModel.editMode == .active {
                                    viewModel.selectedAccommodation = accommodation
                                    viewModel.newMemo = accommodation.memo ?? ""
                                    viewModel.showMemoAlert = true
                                } else {
                                    UIApplication.shared.open(URL(string: accommodation.urlString)!)
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
                    .environment(\.editMode, $viewModel.editMode)
                }
            }
            .toolbar {
                if !viewModel.accommodations.isEmpty {
                    ToolbarItem(placement: .navigationBarLeading) {
                        EditButton(editMode: $viewModel.editMode)
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("SEARCH") {
                        viewModel.showAccommodationSearch()
                    }
                }
            }
            .navigationTitle("WANT_TO_VISIT_TITLE")
            .onAppear {
                viewModel.fetchAccommodations()
            }
            .alert("EDIT_MEMO_TITLE", isPresented: $viewModel.showMemoAlert) {
                TextField("MEMO", text: $viewModel.newMemo)
                    .textInputAutocapitalization(.never)
                Button("OK") {
                    viewModel.selectedAccommodation?.memo = viewModel.newMemo
                    viewModel.updateAccommodation()
                }
                Button("CANCEL", role: .cancel) { }
            } message: {
                Text("EDIT_MEMO_DESCRIPTION")
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct EditButton: View {
    @Binding var editMode: EditMode
    
    var body: some View {
        Button(editMode.isEditing ? "DONE" : "EDIT") {
            switch editMode {
                case .active:
                    editMode = .inactive
                case .inactive:
                    editMode = .active
                default:
                    break
            }
        }
    }
}

#Preview {
    AccommodationRouter.createModule()
}
