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
    @Published var currentRote = CurrentRoute.empty
    
    @Published var cities: [City]
    @Published var schedule: [Schedule] = []
    @Published var filterSchedule: [Schedule] = []
    
    @Published var departureCity: City?
    @Published var arrivalCity: City?
    @Published var departureStation: Station?
    @Published var arrivalStation: Station?
    
    @Published var departureText: String = ""
    @Published var arrivalText: String = ""
    @Published var scheduleText: String = ""
    
    @Published var selectedIntervals: Set<TimeFilters> = []
    @Published var selectedTransferOptions: TransferFilters?
    @Published var isFilteredSchedule: Bool = false
    
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
            self.filterSchedule = schedule
        }
    }
    
    func clearRouteResult() {
        currentRote = .empty
        self.departureText = ""
        self.arrivalText = ""
        self.schedule = []
        self.filterSchedule = []
        self.selectedIntervals = []
        self.selectedTransferOptions = nil
        self.isFilteredSchedule = false
    }
    
    func applyRoteFilters(
        selectedIntervals: Set<TimeFilters>,
        selectedTransferOptions: TransferFilters
    ) {
        filterSchedule = schedule.filter { schedule in
            let selectInterval = selectedIntervals.contains { interval in
                roteIntervals(schedule, timeFilters: interval)
            }
            let transfer = roteTransfers(schedule, transferFilter: selectedTransferOptions)
            return selectInterval && transfer
        }
        isFilteredSchedule = true
    }
    
    // MARK: - Private Methods
    private func getCities() {
        cities = MockData.mockCity
    }

    private func roteTransfers(
        _ schedule: Schedule,
        transferFilter: TransferFilters
    ) -> Bool {
        let transferPoint = schedule.transferPoint
        switch transferFilter {
        case .yes:
            return transferPoint != nil
        case .no:
            return transferPoint == nil
        }
    }
    
    private func roteIntervals(
        _ schedule: Schedule,
        timeFilters: TimeFilters
    ) -> Bool {
        let departureTime = schedule.departureTime
        switch timeFilters {
        case .morning:
            return checkDepartureTime(
                departureTime: departureTime,
                startTime: "06:00",
                endTime: "12:00"
            )
        case .day:
            return checkDepartureTime(
                departureTime: departureTime,
                startTime: "12:00",
                endTime: "18:00"
            )
        case .evening:
            return checkDepartureTime(
                departureTime: departureTime,
                startTime: "18:00",
                endTime: "23:59"
            )
        case .night:
            return checkDepartureTime(
                departureTime: departureTime,
                startTime: "00:00",
                endTime: "06:00"
            )
        }
    }
    
    private func checkDepartureTime(
        departureTime: String,
        startTime: String,
        endTime: String
    ) -> Bool {
        
        guard let departure = stringToDate(time: departureTime),
              let startTime = stringToDate(time: startTime),
              let endTime = stringToDate(time: endTime) else {
            return false
        }
        
        if startTime < departure && departure < endTime {
            return true
        } else {
            return false
        }
    }
    
    private func stringToDate(time: String) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        formatter.locale = Locale(identifier: "ru_Ru")
        return formatter.date(from: time)
    }
}
