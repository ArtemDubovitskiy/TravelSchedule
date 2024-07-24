//
//  MainSearchViewModel.swift
//  TravelSchedule
//
//  Created by Artem Dubovitsky on 30.05.2024.
//
import Foundation

@MainActor
final class MainSearchViewModel: ObservableObject {
    // MARK: - Public Properties
    @Published var currentRote = CurrentRoute.empty
    
    @Published var departureCity: City?
    @Published var arrivalCity: City?
    @Published var departureStation: Station?
    @Published var arrivalStation: Station?
    
    @Published var departureText: String = ""
    @Published var arrivalText: String = ""
    @Published var scheduleText: String = ""
    
    let citiesViewModel = CitiesViewModel()

    // MARK: - Public Methods
    func createDepartureText() {
        if let departureCity = departureCity,
           let departureStation = departureStation {
            self.departureText = departureCity.title + " (\(departureStation.title))"
        }
    }
    
    func createArrivalText() {
        if let arrivalCity = arrivalCity,
           let arrivalStation = arrivalStation {
            self.arrivalText = arrivalCity.title + " (\(arrivalStation.title))"
        }
    }
    
    func createSchuedelText() {
        self.scheduleText = departureText + " → " + arrivalText
    }
    
    func swapStations() {
        swap(&departureCity, &arrivalCity)
        swap(&departureStation, &arrivalStation)
        swap(&departureText, &arrivalText)
    }
    
    func clearRouteResult() {
        currentRote = .empty
        self.departureText = ""
        self.arrivalText = ""
        self.scheduleText = ""
    }
}
