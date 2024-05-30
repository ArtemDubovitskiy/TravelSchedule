//
//  ScheduleViewModel.swift
//  TravelSchedule
//
//  Created by Artem Dubovitsky on 30.05.2024.
//

import Foundation

final class ScheduleViewModel: ObservableObject {
    
    @Published var schedule: [Schedule]
    
    init(schedule: [Schedule]) {
        self.schedule = schedule
        getSchedule()
    }
    
    private func getSchedule() {
        schedule = MockData.mockSchedule
    }
}
