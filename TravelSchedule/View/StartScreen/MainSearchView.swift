//
//  MainSearchView.swift
//  TravelSchedule
//
//  Created by Artem Dubovitsky on 20.05.2024.
//

import SwiftUI

struct MainSearchView: View {
    @State private var departureStation = ""
    @State private var arrivalStation = ""
    @State private var path: [Destination] = []
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
                                              text: $departureStation,
                                              prompt: Text(textFrom).foregroundColor(.ypGray)
                                    )
                                    .foregroundStyle(.ypBlack)
                                    .frame(height: textFieldHeight)
                                    .onTapGesture {
                                        path.append(.cities)
                                    }
                                    
                                    TextField(textTo,
                                              text: $arrivalStation,
                                              prompt: Text(textTo).foregroundColor(.ypGray)
                                    )
                                    .foregroundStyle(.ypBlack)
                                    .frame(height: textFieldHeight)
                                    .onTapGesture {
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
                                swap(&departureStation, &arrivalStation)
                            } label: {
                                Image.changeImage
                                    .foregroundStyle(.ypBlue)
                            }
                        }
                    }
                    .padding(16)
                }
                .padding(.horizontal, 16)
                
                if !departureStation.isEmpty && !arrivalStation.isEmpty {
                    Button {
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
                    path: $path,
                    viewModel: CityViewModel(
                        cities: MockData.mockCity
                    )
                )
                
            case .stations:
                StationsScreenView(
                    path: $path,
                    viewModel: CityViewModel(cities: MockData.mockCity))
                
            case .schuedel:
                ScheduleScreenView(
                    path: $path,
                    viewModel: ScheduleViewModel(schedule: MockData.mockSchedule))
            }
        }
    }
}

#Preview {
    MainSearchView()
}
