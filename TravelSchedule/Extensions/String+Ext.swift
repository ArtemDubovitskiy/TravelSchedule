//
//  String+Ext.swift
//  TravelSchedule
//
//  Created by Artem Dubovitsky on 23.07.2024.
//
import Foundation
// TODO - отладить после рефакторинга
extension String {
    private static let formatter = Date.FormatStyle()
    func parceStringToDateToStrimg() -> String {
        let formatStyle = String.formatter
            .locale(Locale(identifier: "ru_RU"))
            .year()
            .month()
            .day()
        
        let dateStringInput = self
        guard let parseDate = try? formatStyle.parse(dateStringInput) else { return ""}
        
        let outputFormat = String.formatter
            .locale(Locale(identifier: "ru_RU"))
            .day()
            .month(.wide)
        
        return outputFormat.format(parseDate)
    }
}

extension Date {
    private static let formatter = Date.ISO8601FormatStyle()
    func parceDateToString() -> String {
        let dateInput = self

        let outputFormat = Date.formatter
            .locale(Locale(identifier: "ru_RU"))
            .year()
            .day()
            .month()
            .time(includingFractionalSeconds: false)

        return outputFormat.format(dateInput)
    }
}
