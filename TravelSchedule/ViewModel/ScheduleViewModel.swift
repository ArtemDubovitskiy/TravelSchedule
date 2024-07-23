//
//  ScheduleViewModel.swift
//  TravelSchedule
//
//  Created by Artem Dubovitsky on 23.07.2024.
//
import Foundation

@MainActor
final class ScheduleViewModel: ObservableObject {
    @Published var state: AppState = .loading
    @Published var errorType: ErrorType = .serverError
    
    @Published var schedule: [Schedule] = []
    @Published var filterSchedule: [Schedule] = []
    
    @Published var selectedIntervals: Set<TimeFilters> = []
    @Published var selectedTransferOptions: TransferFilters?
    @Published var isFilteredSchedule: Bool = false
    
    // MARK: - Private properties
    private let searchService = SearchService()
    
    // MARK: - Public Methods
    func getSchedule(departure: String, arrival: String) async {
        do {
            schedule.removeAll()
            filterSchedule.removeAll()
            let scheduleSearch = try await searchService.search(
                from: departure,
                to: arrival,
                date: "2024-07-23" // test - исправить
            )
            
            let sortedSchedule = scheduleSearch.sorted { $0.departureTime < $1.departureTime}
            self.schedule = sortedSchedule
            self.filterSchedule = schedule
            state = .content
        } catch {
            self.schedule = []
            state = .error
        }
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
    
    func clearScheduleResult() {
        self.schedule = []
        self.filterSchedule = []
        self.selectedIntervals = []
        self.selectedTransferOptions = nil
        self.isFilteredSchedule = false
    }
    // MARK: - Private Methods
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
        
        return startTime < departure && departure < endTime
    }
    
    private func stringToDate(time: String) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        formatter.locale = Locale(identifier: "ru_Ru")
        return formatter.date(from: time)
    }
}
