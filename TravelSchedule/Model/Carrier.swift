//
//  Carrier.swift
//  TravelSchedule
//
//  Created by Artem Dubovitsky on 18.05.2024.
//
import Foundation

struct Carrier: Hashable, Identifiable, Sendable {
    let id = UUID()
    let title: String
    let logoSvg: String
    let logo: String
    let email: String?
    let phone: String?
}
