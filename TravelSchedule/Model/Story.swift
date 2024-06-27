//
//  Story.swift
//  TravelSchedule
//
//  Created by Artem Dubovitsky on 20.05.2024.
//

import Foundation

struct Story: Hashable, Identifiable {
    let id = UUID()
    let image: String
    let title: String
    let description: String
}
