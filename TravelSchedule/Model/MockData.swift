//
//  MockData.swift
//  TravelSchedule
//
//  Created by Artem Dubovitsky on 19.05.2024.
//
import Foundation

enum MockData {
    // TODO: моковые данные для Preview:
    static let mockCity: [City] = [
        City(
            title: "Москва",
            stations: [
                Station(title: "Киевский вокзал", code: ""),
                Station(title: "Курский вокзал", code: ""),
                Station(title: "Ярославский вокзал", code: ""),
                Station(title: "Белорусский вокзал", code: ""),
                Station(title: "Савеловский вокзал", code: ""),
                Station(title: "Ленинградский вокзал", code: "")
            ]
        ),
        City(
            title: "Санкт Петербург",
            stations: [
                Station(title: "Балтийский вокзал", code: ""),
                Station(title: "Московский вокзал", code: "")
            ]
        ),
        City(
            title: "Сочи",
            stations: [
                Station(title: "Сочи", code: "")
            ]
        ),
        City(
            title: "Горный воздух",
            stations: [
                Station(title: "Горный Воздух", code: "")
            ]
        ),
        City(
            title: "Краснодар",
            stations: [
                Station(title: "Краснодар-1", code: ""),
                Station(title: "Краснодар-2", code: "")
            ]
        ),
        City(
            title: "Казань",
            stations: [
                Station(title: "Казань-Пасс.", code: "")
            ]
        ),
    ]
    
    static let mockCarrier: [Carrier] = [
        Carrier(
            title: "РЖД",
            logoSvg: "RZD",
            logo: "RZDFull",
            email: "i.lozgkina@yandex.ru",
            phone: "+7 (904) 329-27-71"
        ),
        Carrier(
            title: "ФГК",
            logoSvg: "FGK",
            logo: "FGK",
            email: "info@railfgk.ru",
            phone: "8 (800) 250-47-77"
        ),
        Carrier(
            title: "Урал логистика",
            logoSvg: "Ural",
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
    // TODO: Моковые данные для Stories:
    private static let storyTitle = "Text Text Text Text Text Text Text Text Text Text "
    private static let storyDescription: String = storyTitle + storyTitle + storyTitle
    
    static let mockStories: [Stories] = [
        .init(
            stories: [
                Story(image: "Big01",
                      title: storyTitle,
                      description: storyDescription),
                Story(image: "Big02",
                      title: storyTitle,
                      description: storyDescription),
                Story(image: "Big03",
                      title: storyTitle,
                      description: storyDescription),
                Story(image: "Big01",
                      title: storyTitle,
                      description: storyDescription)],
            isRead: false
        ),
        .init(
            stories: [
                Story(image: "Big04",
                      title: storyTitle,
                      description: storyDescription),
                Story(image: "Big05",
                      title: storyTitle,
                      description: storyDescription),
                Story(image: "Big06",
                      title: storyTitle,
                      description: storyDescription)],
            isRead: false
        ),
        .init(
            stories: [
                Story(image: "Big07",
                      title: storyTitle,
                      description: storyDescription),
                Story(image: "Big08",
                      title: storyTitle,
                      description: storyDescription),
                Story(image: "Big09",
                      title: storyTitle,
                      description: storyDescription)],
            isRead: false
        ),
        .init(
            stories: [
                Story(image: "Big10",
                      title: storyTitle,
                      description: storyDescription),
                Story(image: "Big01",
                      title: storyTitle,
                      description: storyDescription),
                Story(image: "Big02",
                      title: storyTitle,
                      description: storyDescription)],
            isRead: true
        ),
        .init(
            stories: [
                Story(image: "Big06",
                      title: storyTitle,
                      description: storyDescription),
                Story(image: "Big05",
                      title: storyTitle,
                      description: storyDescription),
                Story(image: "Big10",
                      title: storyTitle,
                      description: storyDescription)],
            isRead: false
        ),
        .init(
            stories: [
                Story(image: "Big08",
                      title: storyTitle,
                      description: storyDescription
                     ),
                Story(image: "Big09",
                      title: storyTitle,
                      description: storyDescription
                     ),
                Story(image: "Big01",
                      title: storyTitle,
                      description: storyDescription)],
            isRead: false
        )
    ]
}
