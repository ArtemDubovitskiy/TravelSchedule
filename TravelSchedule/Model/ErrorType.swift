//
//  ErrorType.swift
//  TravelSchedule
//
//  Created by Artem Dubovitsky on 12.05.2024.
//
import Foundation

enum ErrorType: String, CaseIterable {
    case networkConnecting
    case serverError
    
    // TODO: Добавить локализацию:
    var text: String {
        switch self {
        case .networkConnecting:
            return "Нет интернета"
        case .serverError:
            return "Ошибка сервера"
        }
    }
    
    var image: String {
        switch self {
        case .networkConnecting:
            return "No Internet"
        case .serverError:
            return "Server Error"
        }
    }
}
