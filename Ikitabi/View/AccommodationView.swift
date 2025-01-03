//
//  AccommodationView.swift
//  Ikitabi
//
//  Created by Shotaro Doi on 2024/12/08.
//

import SwiftUI

struct AccommodationView: View {
    @ObservedObject var viewModel: AccommodationViewModel
    @State private var editMode: EditMode = .inactive
    @State private var showMemoAlert = false
    @State private var selectedAccommodation: Accommodation?
    @State private var newMemo: String = ""
    
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
                                Text(accommodation.name)
                                    .font(.headline)
                                    .foregroundColor(.blue)

                                if let memo = accommodation.memo {
                                    Text("メモ: \(memo)")
                                        .font(.system(size: 15))
                                        .foregroundColor(.gray)
                                }
                            }
                            .onTapGesture {
                                if editMode == .active {
                                    selectedAccommodation = accommodation
                                    newMemo = accommodation.memo ?? ""
                                    showMemoAlert = true
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
                    .environment(\.editMode, $editMode)
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton(editMode: $editMode)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("search") {
                        viewModel.showAccommodationSearch()
                    }
                }
            }
            .navigationTitle("Want to visit")
            .onAppear {
                viewModel.fetchAccommodations()
            }
            .alert("Edit Memo", isPresented: $showMemoAlert) {
                TextField("Memo", text: $newMemo)
                    .textInputAutocapitalization(.never)
                Button("OK") {
                    selectedAccommodation?.memo = newMemo
                    viewModel.updateAccommodation()
                }
                Button("Cancel", role: .cancel) { }
            } message: {
                Text("Please enter the anything")
            }
        }
    }
}

struct EditButton: View {
    @Binding var editMode: EditMode
    
    var body: some View {
        Button(editMode.isEditing ? "Done" : "Edit") {
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
