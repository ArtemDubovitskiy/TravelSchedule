//
//  DateComponentsFormatter+Ext.swift
//  TravelSchedule
//
//  Created by Artem Dubovitsky on 22.07.2024.
//
import Foundation

extension DateComponentsFormatter {
    static let formatter: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute]
        formatter.unitsStyle = .full
        return formatter
    }()
}
