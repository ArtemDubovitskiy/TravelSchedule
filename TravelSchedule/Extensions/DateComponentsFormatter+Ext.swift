//
//  DateComponentsFormatter+Ext.swift
//  TravelSchedule
//
//  Created by Artem Dubovitsky on 22.07.2024.
//
import Foundation

extension DateComponentsFormatter {
    static let formatter: DateComponentsFormatter = {
        var calendar = Calendar.current
        calendar.locale = Locale(identifier: "ru")
        let formatter = DateComponentsFormatter()
        formatter.calendar = calendar
        // Можно поменять на часы и полное наименование (некоторые рейсы актуальны в минутах)
        formatter.allowedUnits = [.hour, .minute]
        formatter.unitsStyle = .abbreviated
        return formatter
    }()
}
