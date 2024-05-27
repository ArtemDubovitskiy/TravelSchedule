//
//  CityViewModel.swift
//  TravelSchedule
//
//  Created by Artem Dubovitsky on 27.05.2024.
//

import Foundation

final class CityViewModel: ObservableObject {
    @Published var cities: [City]
    
    init(cities: [City]) {
        self.cities = cities
        getCities()
    }
    
    private func getCities() {
        cities = MockData.mockCity
    }
}
