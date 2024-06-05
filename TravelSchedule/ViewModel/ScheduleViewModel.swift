//
//  ScheduleViewModel.swift
//  TravelSchedule
//
//  Created by Artem Dubovitsky on 30.05.2024.
//
import Foundation

final class ScheduleViewModel: ObservableObject {
    
    enum State {
        case loading
        case content
        case error
    }
    
    // MARK: - Public Properties
    @Published var state: State = .content
    @Published var errorType: ErrorType = .serverError
    
    @Published var cities: [City]
    @Published var schedule: [Schedule] = []
    
    @Published var departureCity: City?
    @Published var arrivalCity: City?
    @Published var departureStation: Station?
    @Published var arrivalStation: Station?
    
    @Published var currentRote = CurrentRoute.empty
    
    @Published var departureText: String = ""
    @Published var arrivalText: String = ""
    @Published var scheduleText: String = ""
    
    // MARK: - Initializers
    init(cities: [City]) {
        self.cities = cities
        getCities()
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
    
    func createSchuedelText() {
        self.scheduleText = departureText + " → " + arrivalText
    }
    
    func swapStations() {
        swap(&departureCity, &arrivalCity)
        swap(&departureStation, &arrivalStation)
        swap(&departureText, &arrivalText)
    }
    
    func showSchuedel() {
        // Метод сделан на моках, для отображения заглушки на экране расписания
        if departureText == "Москва (Ярославский вокзал)" &&
            arrivalText == "Санкт Петербург (Балтийский вокзал)" {
            self.schedule = MockData.mockSchedule
        }
    }
    
    func clearRouteText() {
        currentRote = .empty
        self.departureText = ""
        self.arrivalText = ""
        self.schedule = []
    }
    
    // MARK: - Private Methods
    private func getCities() {
        cities = MockData.mockCity
    }
}
