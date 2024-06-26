//
//  Station.swift
//  TravelSchedule
//
//  Created by Artem Dubovitsky on 18.05.2024.
//
import Foundation

struct Station: Hashable, Identifiable {
    let id = UUID()
    let title: String
}
