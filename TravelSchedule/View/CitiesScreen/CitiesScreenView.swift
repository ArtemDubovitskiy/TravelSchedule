//
//  CitiesScreenView.swift
//  TravelSchedule
//
//  Created by Artem Dubovitsky on 27.05.2024.
//

import SwiftUI

struct CitiesScreenView: View {
    @State private var searchTextString = ""
    @StateObject var viewModel: CityViewModel
    
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
        VStack {
            SearchBar(searchText: $searchTextString)
            if searchResults.isEmpty {
                Spacer()
                Text(cityNotFoundText)
                    .font(.bold24)
                    .foregroundStyle(.ypBlackDual)
                    .padding(.horizontal)
                Spacer()
            }
            LazyVStack(spacing: 0) {
                ForEach(searchResults) { city in
                    CityCellView(city: city)
                }
            }
            .padding(.horizontal, 16)
            Spacer()
        }
        .toolbar(.hidden, for: .tabBar)
        .navigationTitle(selectCityText)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea(.all, edges: .bottom)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    dismiss() // заглушка
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
        CitiesScreenView(viewModel: CityViewModel(cities: MockData.mockCity))
    }
}
