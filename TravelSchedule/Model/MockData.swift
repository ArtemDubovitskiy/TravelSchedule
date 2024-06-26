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
            logoFull: "RZDFull",
            email: "i.lozgkina@yandex.ru",
            phone: "+7 (904) 329-27-71"
        ),
        Carrier(
            title: "ФГК",
            logo: "FGK", 
            logoFull: "FGK",
            email: "info@railfgk.ru",
            phone: "8 (800) 250-47-77"
        ),
        Carrier(
            title: "Урал логистика",
            logo: "Ural", 
            logoFull: "Ural",
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
    
    static let mockStories: [Story] = [
        Story(
            title: "Text Text Text Text Text Text Text Text",
            description: "Text Text Text Text Text Text Text Text",
            smallImage: "Preview01",
            fullImage: ["Big01","Big02","Big03"]
        ),
        Story(
            title: "Text Text Text Text Text Text Text Text",
            description: "Text Text Text Text Text Text Text Text",
            smallImage: "Preview02",
            fullImage: ["Big04","Big05","Big06"]
        ),
        Story(
            title: "Text Text Text Text Text Text Text Text",
            description: "Text Text Text Text Text Text Text Text",
            smallImage: "Preview03",
            fullImage: ["Big07","Big08","Big09"]
        ),
        Story(
            title: "Text Text Text Text Text Text Text Text",
            description: "Text Text Text Text Text Text Text Text",
            smallImage: "Preview04",
            fullImage: ["Big10","Big01","Big02"]
        ),
        Story(
            title: "Text Text Text Text Text Text Text Text",
            description: "Text Text Text Text Text Text Text Text",
            smallImage: "Preview05",
            fullImage: ["Big04","Big05","Big06"]
        ),
        Story(
            title: "Text Text Text Text Text Text Text Text",
            description: "Text Text Text Text Text Text Text Text",
            smallImage: "Preview01",
            fullImage: ["Big07","Big05","Big09"]
        ),
    ]
}
