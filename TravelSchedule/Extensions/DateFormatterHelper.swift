//
//  DateFormatterHelper.swift
//  TravelSchedule
//
//  Created by Artem Dubovitsky on 22.07.2024.
//
import Foundation

enum DateFormatterHelper {

    static let componentsFormatter: DateComponentsFormatter = {
        var calendar = Calendar.current
        calendar.locale = Locale(identifier: "ru")
        let formatter = DateComponentsFormatter()
        formatter.calendar = calendar
        // Можно поменять на часы и полное наименование (некоторые рейсы актуальны в минутах)
        formatter.allowedUnits = [.hour, .minute]
        formatter.unitsStyle = .abbreviated
        return formatter
    }()

    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.locale = Locale(identifier: "ru_Ru")
        return formatter
    }()
    
    static func stringFormatter(_ date: String) -> String {
        let inputFormat = Date.ISO8601FormatStyle()
            .year()
            .month()
            .day()
        
        let dateStringInput = date
        guard let parseDate = try? inputFormat.parse(dateStringInput) else { return ""}
        
        let outputFormat = Date.FormatStyle()
            .locale(Locale(identifier: "ru_RU"))
            .day()
            .month(.wide)
        
        return outputFormat.format(parseDate)
    }
}
