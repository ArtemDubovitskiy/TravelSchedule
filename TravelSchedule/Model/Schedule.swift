//
//  Schedule.swift
//  TravelSchedule
//
//  Created by Artem Dubovitsky on 18.05.2024.
//

import Foundation

struct Schedule: Hashable, Identifiable {
    let id = UUID()
    let date: String
    let departureTime: String
    let arrivalTime: String
    let durationTime: String
    let transferPoint: String?
    let carrier: Carrier
}
