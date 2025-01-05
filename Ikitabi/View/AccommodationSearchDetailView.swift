//
//  AccommodationSearchDetailView.swift
//  Ikitabi
//
//  Created by Shotaro Doi on 2025/01/01.
//

import SwiftUI

struct AccommodationSearchDetailView: View {
    @ObservedObject var viewModel: AccommodationSearchDetailViewModel
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack {
            Spacer()

            VStack(spacing: 0) {
                Text("HOTEL_NAME")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                
                Link(destination: URL(string: viewModel.accommodationSearchResult.urlString)!) {
                    HStack(spacing: 8) {
                        Text(viewModel.accommodationSearchResult.name)
                            .font(.largeTitle)
                            .foregroundColor(.blue)
                            .multilineTextAlignment(.center)
                        Image(systemName: "link")
                            .foregroundColor(.blue)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.green.opacity(0.2))
                }
            }
            .padding()

            AsyncImage(url: URL(string: viewModel.accommodationSearchResult.imageURLString)) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
                    .frame(width: 240, height: 126)
            }
            .frame(maxWidth: .infinity)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            
            HStack(spacing: 8) {
                Text(String(format: "%.1f", viewModel.accommodationSearchResult.review))
                    .font(.headline)
                    .foregroundColor(.gray)
                
                HStack(spacing: 4) {
                    ForEach(0..<5) { index in
                        ZStack {
                            Image(systemName: "star")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(.gray)
                            
                            GeometryReader { geometry in
                                Rectangle()
                                    .fill(Color.yellow)
                                    .frame(width: starFillWidth(for: Float(index), rating: viewModel.accommodationSearchResult.review) * geometry.size.width)
                                    .clipped()
                            }
                            .mask(
                                Image(systemName: "star.fill")
                                    .resizable()
                                    .scaledToFit()
                            )
                        }
                        .frame(width: 24, height: 24)
                    }
                }
            }
            .padding(.bottom, 20)

            VStack(spacing: 0) {
                Text("MEMO")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                
                TextField("ENTER_MEMO_DESCRIPTION", text: $viewModel.currentMemo)
                    .padding()
                    .background(Color.green.opacity(0.2))
                    .frame(maxWidth: .infinity)
            }
            .padding()
            Spacer()
                .frame(height: 20)
            
            Button(action: {
                viewModel.handleSaveButtonTapped()
                dismiss()
            }) {
                Text("SAVE")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.horizontal)
            .padding(.bottom, 20)
            .disabled(viewModel.isSaved)
            .opacity(viewModel.isSaved ? 0.5 : 1.0)
            
            Spacer()
        }
        .background(Color(uiColor: UIColor.secondarySystemBackground))
    }
}

private func starFillWidth(for index: Float, rating: Float) -> CGFloat {
    if rating >= index + 1 {
        return 1.0
    } else if rating > index {
        return CGFloat(rating - index)
    } else {
        return 0.0
    }
}
