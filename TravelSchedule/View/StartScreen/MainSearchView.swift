//
//  MainSearchView.swift
//  TravelSchedule
//
//  Created by Artem Dubovitsky on 20.05.2024.
//

import SwiftUI

struct MainSearchView: View {
    @State private var path: [Destination] = []
    @ObservedObject var mainSearchViewModel = MainSearchViewModel()
    // TODO: Добавить локализацию
    private let textFrom = "Откуда"
    private let textTo = "Куда"
    private let buttonText = "Найти"
    
    private let radius: Double = 20
    private let bigRectangleHeight: Double = 128
    private let smallRectangleHeight: Double = 96
    private let textFieldHeight: Double = 48
    private let circleWidth: Double = 36
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack(spacing: 16) {
                ZStack {
                    RoundedRectangle(cornerRadius: radius)
                        .foregroundStyle(.ypBlue)
                        .frame(height: bigRectangleHeight)
                    HStack(spacing: 16) {
                        RoundedRectangle(cornerRadius: radius)
                            .foregroundStyle(.ypWhite)
                            .frame(height: smallRectangleHeight)
                            .overlay(
                                VStack(spacing: 0) {
                                    TextField(textFrom,
                                              text: $mainSearchViewModel.departureText,
                                              prompt: Text(textFrom).foregroundColor(.ypGray)
                                    )
                                    .foregroundStyle(.ypBlack)
                                    .frame(height: textFieldHeight)
                                    .onTapGesture {
                                        mainSearchViewModel.currentRote = .departure
                                        path.append(.cities)
                                    }
                                    
                                    TextField(textTo,
                                              text: $mainSearchViewModel.arrivalText,
                                              prompt: Text(textTo).foregroundColor(.ypGray)
                                    )
                                    .foregroundStyle(.ypBlack)
                                    .frame(height: textFieldHeight)
                                    .onTapGesture {
                                        mainSearchViewModel.currentRote = .arrival
                                        path.append(.cities)
                                    }
                                }
                                    .padding(.leading, 10)
                            )
                        ZStack {
                            Circle()
                                .foregroundStyle(.ypWhite)
                                .frame(width: circleWidth)
                            Button {
                                mainSearchViewModel.swapStations()
                            } label: {
                                Image.changeImage
                                    .foregroundStyle(.ypBlue)
                            }
                        }
                    }
                    .padding(16)
                }
                .padding(.horizontal, 16)
                
                if !mainSearchViewModel.departureText.isEmpty &&
                    !mainSearchViewModel.arrivalText.isEmpty &&
                    mainSearchViewModel.departureCity != nil &&
                    mainSearchViewModel.departureStation != nil &&
                    mainSearchViewModel.arrivalCity != nil &&
                    mainSearchViewModel.arrivalStation != nil {
                    Button {
                        self.mainSearchViewModel.createSchuedelText()
                        path.append(.schuedel)
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 16)
                                .foregroundStyle(.ypBlue)
                                .frame(width: 150, height: 60)
                            Text(buttonText)
                                .font(.bold17)
                                .foregroundStyle(.ypWhite)
                                .multilineTextAlignment(.center)
                        }
                    }
                }
            }
        }
        .navigationDestination(for: Destination.self) { destination in
            switch destination {
            case .cities:
                CitiesScreenView(
                    mainSearchViewModel: mainSearchViewModel, 
                    viewModel: mainSearchViewModel.citiesViewModel,
                    path: $path
                )
                
            case .stations:
                StationsScreenView(
                    mainSearchViewModel: mainSearchViewModel,
                    path: $path
                )
                
            case .schuedel:
                ScheduleScreenView(
                    mainSearchViewModel: mainSearchViewModel,
                    path: $path
                )
            }
        }
    }
}

#Preview {
    MainSearchView()
}
