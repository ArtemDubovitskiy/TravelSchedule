//
//  DateFormatter+Ext.swift
//  TravelSchedule
//
//  Created by Artem Dubovitsky on 23.07.2024.
//
import Foundation

extension DateFormatter {
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.locale = Locale(identifier: "ru_Ru")
        return formatter
    }()
}
