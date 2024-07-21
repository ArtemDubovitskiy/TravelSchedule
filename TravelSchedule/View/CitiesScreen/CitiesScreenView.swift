//
//  CitiesScreenView.swift
//  TravelSchedule
//
//  Created by Artem Dubovitsky on 27.05.2024.
//

import SwiftUI

struct CitiesScreenView: View {
    
    @Binding var path: [Destination]
    @EnvironmentObject var viewModel: ScheduleViewModel
    
    @State private var searchTextString = ""
    @Environment(\.dismiss) private var dismiss // заглушка
    
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
        switch viewModel.state {
        case .loading:
            ProgressView()
            
        case .content:
            VStack {
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
                                    switch viewModel.currentRote {
                                    case .departure:
                                        viewModel.departureCity = city
                                    case .arrival:
                                        viewModel.arrivalCity = city
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
            }
            .environmentObject(viewModel)
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
            
        case .error:
            ErrorView(errorType: viewModel.errorType)
        }
    }
}

#Preview {
    NavigationStack {
        CitiesScreenView(path: .constant([]))
            .environmentObject(ScheduleViewModel(cities: []))
    }
}
