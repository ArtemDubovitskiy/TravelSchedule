//
//  CitiesViewModel.swift
//  TravelSchedule
//
//  Created by Artem Dubovitsky on 23.07.2024.
//
import Foundation

@MainActor
final class CitiesViewModel: ObservableObject, Sendable {
    // MARK: - Public Properties
    @Published var state: AppState = .loading
    @Published var errorType: ErrorType = .serverError
    @Published var cities: [City] = []
    
    // MARK: - Private properties
    private let stationService = StationsListService()
    
    // MARK: - Public Methods
    func getCities() async {
        do {
            let cities = try await stationService.stationsList()
            let sorted = cities.filter { !$0.stations.isEmpty }
            let sortedCity = sorted.sorted { $0.title < $1.title }
            self.cities = sortedCity
            state = .content
        } catch {
            self.cities = []
            self.state = .error
        }
    }
}
