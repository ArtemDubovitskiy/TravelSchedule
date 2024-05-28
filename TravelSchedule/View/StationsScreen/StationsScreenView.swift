//
//  StationsScreenView.swift
//  TravelSchedule
//
//  Created by Artem Dubovitsky on 28.05.2024.
//

import SwiftUI

struct StationsScreenView: View {
    @State private var searchTextString = ""
    @StateObject var viewModel: CityViewModel
    
    @Environment(\.dismiss) private var dismiss // заглушка
    
    // TODO: Добавить локализацию
    private let selectStationText = "Выбор станции"
    private let stationNotFoundText = "Станция не найдена"
    
    // TODO: исправить метод после доработки viewModel
    private var searchResults: [Station] {
        if searchTextString.isEmpty {
            return viewModel.cities[0].stations
        } else {
            return viewModel.cities[0].stations.filter {
                $0.title.lowercased().contains(searchTextString.lowercased())
            }
        }
        
    }
    
    var body: some View {
        VStack {
            SearchBar(searchText: $searchTextString)
            if searchResults.isEmpty {
                Spacer()
                Text(stationNotFoundText)
                    .font(.bold24)
                    .foregroundStyle(.ypBlackDual)
                    .padding(.horizontal)
                Spacer()
            }
            LazyVStack(spacing: 0) {
                ForEach(searchResults) { station in
                    StationCellView(station: station)
                }
            }
            .padding(.horizontal, 16)
            Spacer()
        }
        .toolbar(.hidden, for: .tabBar)
        .navigationTitle(selectStationText)
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
        StationsScreenView(viewModel: CityViewModel(cities: MockData.mockCity))
    }
}
