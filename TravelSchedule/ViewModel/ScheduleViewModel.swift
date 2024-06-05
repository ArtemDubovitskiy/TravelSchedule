//
//  ScheduleViewModel.swift
//  TravelSchedule
//
//  Created by Artem Dubovitsky on 30.05.2024.
//
import Foundation

final class ScheduleViewModel: ObservableObject {
    // MARK: - Public Properties
    @Published var cities: [City]
    @Published var schedule: [Schedule]
    
    @Published var departureCity: City?
    @Published var arrivalCity: City?
    @Published var departureStation: Station?
    @Published var arrivalStation: Station?
    
    @Published var currentRote = CurrentRoute.empty
    
    @Published var departureText: String = ""
    @Published var arrivalText: String = ""
    
    // MARK: - Initializers
    init(cities: [City], schedule: [Schedule]) {
        self.cities = cities
        self.schedule = schedule
        getCities()
        getSchedule()
    }
    
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
    
    func swapStations() {
        swap(&departureCity, &arrivalCity)
        swap(&departureStation, &arrivalStation)
        swap(&departureText, &arrivalText)
    }
    
    func clearRouteText() {
        currentRote = .empty
        self.departureText = ""
        self.arrivalText = ""
    }
    
    // MARK: - Private Methods
    private func getCities() {
        cities = MockData.mockCity
    }
    
    private func getSchedule() {
        schedule = MockData.mockSchedule
    }
}
