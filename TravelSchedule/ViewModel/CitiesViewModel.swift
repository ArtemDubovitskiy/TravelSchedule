//
//  CitiesViewModel.swift
//  TravelSchedule
//
//  Created by Artem Dubovitsky on 23.07.2024.
//
import Foundation

@MainActor
final class CitiesViewModel: ObservableObject, @unchecked Sendable {
    @Published var state: AppState = .loading
    @Published var errorType: ErrorType = .serverError
    @Published var cities: [City] = []
    
    // MARK: - Private properties
    private let stationService = StationsListService()
    
    // MARK: - Public Methods
    func getCities() async {
        do {
            cities.removeAll()
            state = .loading
            let cities = try await stationService.stationsList()
            let sortedCity = cities.sorted { $0.title < $1.title }
            self.cities = sortedCity
            state = .content
        } catch {
            self.cities = []
            state = .error
        }
    }
}
