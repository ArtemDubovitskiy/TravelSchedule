//
//  Filters.swift
//  TravelSchedule
//
//  Created by Artem Dubovitsky on 02.06.2024.
//
import Foundation

enum TimeFilters: String, CaseIterable {
    case morning
    case day
    case evening
    case night
    
    // TODO: Добавить локализацию
    var title: String {
        switch self {
        case .morning:
            return "Утро 06:00 - 12:00"
        case .day:
            return "День 12:00 - 18:00"
        case .evening:
            return "Вечер 18:00 - 00:00"
        case .night:
            return "Ночь 00:00 - 06:00"
        }
    }
}

enum TransferFilters: String, CaseIterable {
    case yes
    case no
    
    // TODO: Добавить локализацию
    var title: String {
        switch self {
        case .yes:
            return "Да"
        case .no:
            return "Нет"
        }
    }
}
