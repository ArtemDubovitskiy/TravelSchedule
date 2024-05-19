//
//  City.swift
//  TravelSchedule
//
//  Created by Artem Dubovitsky on 07.05.2024.
//
import Foundation

struct City: Hashable, Identifiable {
    let id = UUID()
    let title: String
    let stations: [Station]
}
