//
//  MockData.swift
//  TravelSchedule
//
//  Created by Artem Dubovitsky on 19.05.2024.
//
import Foundation

enum MockData {
    static let mockCity: [City] = [
        City(
            title: "Москва",
            stations: [
                Station(title: "Киевский вокзал"),
                Station(title: "Курский вокзал"),
                Station(title: "Ярославский вокзал"),
                Station(title: "Белорусский вокзал"),
                Station(title: "Савеловский вокзал"),
                Station(title: "Ленинградский вокзал")
            ]
        ),
        City(
            title: "Санкт Петербург",
            stations: [
                Station(title: "Балтийский вокзал"),
                Station(title: "Московский вокзал")
            ]
        ),
        City(
            title: "Сочи",
            stations: [
                Station(title: "Сочи")
            ]
        ),
        City(
            title: "Горный воздух",
            stations: [
                Station(title: "Горный Воздух")
            ]
        ),
        City(
            title: "Краснодар",
            stations: [
                Station(title: "Краснодар-1"),
                Station(title: "Краснодар-2")
            ]
        ),
        City(
            title: "Казань",
            stations: [
                Station(title: "Казань-Пасс.")
            ]
        ),
    ]
    
    static let mockCarrier: [Carrier] = [
        Carrier(
            title: "РЖД",
            logo: "RZD",
            email: "i.lozgkina@yandex.ru",
            phone: "+7 (904) 329-27-71"
        ),
        Carrier(
            title: "ФГК",
            logo: "FGK",
            email: "8-800-250-4777",
            phone: "info@railfgk.ru"
        ),
        Carrier(
            title: "Урал логистика",
            logo: "Ural",
            email: "contact@ural-lg.ru",
            phone: "8 (800) 505-49-84"
        ),
    ]
    
    static let mockSchedule: [Schedule] = [
        Schedule(
            date: "14 января",
            departureTime: "22:30",
            arrivalTime: "08:15",
            durationTime: "20 часов",
            transferPoint: "Костроме",
            carrier: MockData.mockCarrier[0]
        ),
        Schedule(
            date: "15 января",
            departureTime: "01:15",
            arrivalTime: "09:00",
            durationTime: "9 часов",
            transferPoint: nil,
            carrier: MockData.mockCarrier[1]
        ),
        Schedule(
            date: "16 января",
            departureTime: "12:30",
            arrivalTime: "21:00",
            durationTime: "9 часов",
            transferPoint: nil,
            carrier: MockData.mockCarrier[2]
        ),
        Schedule(
            date: "17 января",
            departureTime: "22:30",
            arrivalTime: "08:15",
            durationTime: "20 часов",
            transferPoint: "Костроме",
            carrier: MockData.mockCarrier[0]
        ),
        Schedule(
            date: "17 января",
            departureTime: "23:00",
            arrivalTime: "09:00",
            durationTime: "20 часов",
            transferPoint: nil,
            carrier: MockData.mockCarrier[0]
        ),
    ]
}
