//
//  StationsScreenView.swift
//  TravelSchedule
//
//  Created by Artem Dubovitsky on 28.05.2024.
//

import SwiftUI

struct StationsScreenView: View {
    @ObservedObject var mainSearchViewModel: MainSearchViewModel
    @Binding var path: [Destination]
    @State private var searchTextString = ""
    @Environment(\.dismiss) private var dismiss
    
    // TODO: Добавить локализацию
    private let selectStationText = "Выбор станции"
    private let stationNotFoundText = "Станция не найдена"
    
    private var searchResults: [Station] {
        switch mainSearchViewModel.currentRote {
        case .departure:
            if searchTextString.isEmpty {
                return mainSearchViewModel.departureCity?.stations ?? []
            } else {
                return mainSearchViewModel.departureCity?.stations.filter {
                    $0.title.lowercased().contains(searchTextString.lowercased())
                } ?? []
            }
        case .arrival:
            if searchTextString.isEmpty {
                return mainSearchViewModel.arrivalCity?.stations ?? []
            } else {
                return mainSearchViewModel.arrivalCity?.stations.filter {
                    $0.title.lowercased().contains(searchTextString.lowercased())
                } ?? []
            }
        case .empty:
            return []
        }
    }
    
    var body: some View {
        VStack {
            SearchBar(searchText: $searchTextString)
            if searchResults.isEmpty {
                VStack {
                    Spacer()
                    Text(stationNotFoundText)
                        .font(.bold24)
                        .foregroundStyle(.ypBlackDual)
                        .padding(.horizontal)
                    Spacer()
                }
            }
            ScrollView {
                LazyVStack(spacing: 0) {
                    ForEach(searchResults) { station in
                        StationCellView(station: station)
                            .onTapGesture {
                                switch mainSearchViewModel.currentRote {
                                case .departure:
                                    mainSearchViewModel.departureStation = station
                                    mainSearchViewModel.createDepartureText()
                                case .arrival:
                                    mainSearchViewModel.arrivalStation = station
                                    mainSearchViewModel.createArrivalText()
                                case .empty:
                                    break
                                }
                                path.removeAll()
                            }
                    }
                }
                .padding(.horizontal, 16)
                Spacer()
            }
        }
        .toolbar(.hidden, for: .tabBar)
        .navigationTitle(selectStationText)
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
        StationsScreenView(
            mainSearchViewModel: MainSearchViewModel(),
            path: .constant([])
        )
    }
}
