//
//  StationsScreenView.swift
//  TravelSchedule
//
//  Created by Artem Dubovitsky on 28.05.2024.
//

import SwiftUI

struct StationsScreenView: View {
    @Binding var path: [Destination]
    @State private var searchTextString = ""
    @EnvironmentObject var viewModel: ScheduleViewModel
    @Environment(\.dismiss) private var dismiss // заглушка
    
    // TODO: Добавить локализацию
    private let selectStationText = "Выбор станции"
    private let stationNotFoundText = "Станция не найдена"
    
    private var searchResults: [Station] {
        switch viewModel.currentRote {
        case .departure:
            if searchTextString.isEmpty {
                return viewModel.departureCity?.stations ?? []
            } else {
                return viewModel.departureCity?.stations.filter {
                    $0.title.lowercased().contains(searchTextString.lowercased())
                } ?? []
            }
        case .arrival:
            if searchTextString.isEmpty {
                return viewModel.arrivalCity?.stations ?? []
            } else {
                return viewModel.arrivalCity?.stations.filter {
                    $0.title.lowercased().contains(searchTextString.lowercased())
                } ?? []
            }
        case .empty:
            return []
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
                            .onTapGesture {
                                switch viewModel.currentRote {
                                case .departure:
                                    viewModel.departureStation = station
                                    viewModel.createDepartureText()
                                case .arrival:
                                    viewModel.arrivalStation = station
                                    viewModel.createArrivalText()
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
            .environmentObject(viewModel)
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
            
        case .error:
            ErrorView(errorType: viewModel.errorType)
        }
    }
}

#Preview {
    NavigationStack {
        StationsScreenView(path: .constant([])).environmentObject(ScheduleViewModel(cities: []))
    }
}
