//
//  Stories.swift
//  TravelSchedule
//
//  Created by Artem Dubovitsky on 28.06.2024.
//
import Foundation

struct Stories: Hashable, Identifiable {
    let id = UUID()
    let stories: [Story]
    var isRead: Bool
}
