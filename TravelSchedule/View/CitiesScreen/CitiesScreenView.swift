//
//  CitiesScreenView.swift
//  TravelSchedule
//
//  Created by Artem Dubovitsky on 27.05.2024.
//

import SwiftUI

struct CitiesScreenView: View {
    @ObservedObject var mainSearchViewModel: MainSearchViewModel
    @ObservedObject var viewModel: CitiesViewModel
    @Binding var path: [Destination]
    @State private var searchTextString = ""
    @Environment(\.dismiss) private var dismiss
    // TODO: Добавить локализацию
    private let selectCityText = "Выбор города"
    private let cityNotFoundText = "Город не найден"
    
    private var searchResults: [City] {
        if searchTextString.isEmpty {
            return viewModel.cities
        } else {
            return viewModel.cities.filter {
                $0.title.lowercased().contains(searchTextString.lowercased())
            }
        }
    }
    
    var body: some View {
        VStack {
            switch viewModel.state {
            case .loading:
                ProgressView()
                    .task {
                        await viewModel.getCities()
                    }
            case .content:
                SearchBar(searchText: $searchTextString)
                if searchResults.isEmpty {
                    VStack {
                        Spacer()
                        Text(cityNotFoundText)
                            .font(.bold24)
                            .foregroundStyle(.ypBlackDual)
                            .padding(.horizontal)
                            .padding(.vertical)
                        Spacer()
                    }
                }
                ScrollView {
                    LazyVStack(spacing: 0) {
                        ForEach(searchResults) { city in
                            CityCellView(city: city)
                                .onTapGesture {
                                    switch mainSearchViewModel.currentRote {
                                    case .departure:
                                        mainSearchViewModel.departureCity = city
                                    case .arrival:
                                        mainSearchViewModel.arrivalCity = city
                                    case .empty:
                                        break
                                    }
                                    path.append(.stations)
                                }
                        }
                    }
                    .padding(.horizontal, 16)
                    Spacer()
                }
            case .error:
                ErrorView(errorType: viewModel.errorType)
            }
        }
        .toolbar(.hidden, for: .tabBar)
        .navigationTitle(selectCityText)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea(.all, edges: .bottom)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    path.removeLast()
                    dismiss()
                } label: {
                    Image.chevronBackward
                        .foregroundStyle(.ypBlackDual)
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        CitiesScreenView(
            mainSearchViewModel: MainSearchViewModel(), 
            viewModel: CitiesViewModel(),
            path: .constant([])
        )
    }
}
