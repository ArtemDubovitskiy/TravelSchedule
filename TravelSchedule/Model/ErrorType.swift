//
//  ErrorType.swift
//  TravelSchedule
//
//  Created by Artem Dubovitsky on 12.05.2024.
//
import Foundation

struct ErrorData {
    let description: String
    let image: String
}

enum ErrorType: String, CaseIterable {
    case networkConnecting
    case serverError
    
    // TODO: Добавить локализацию:
    var info: ErrorData {
        switch self {
        case .networkConnecting:
            return ErrorData(description: "Нет интернета", image: "No Internet")
        case .serverError:
            return ErrorData(description: "Ошибка сервера", image: "Server Error")
        }
    }
}
