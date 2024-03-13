//
//  ContentPresenter.swift
//  TravelSchedule
//
//  Created by Artem Dubovitsky on 12.03.2024.
//
import Foundation
import OpenAPIURLSession

enum Constants {
    static let apiKey = "d77ed0d2-6f01-4f92-967d-35ca9411ee0c"
}

protocol ContentPresenterProtocol: AnyObject {
    func nearestStations()
    func nearestSettlement()
    func carrier()
    func copyright()
}

// Вероятно не лучший вариант использовать Presenter (хотел на данный момент вынести логику отдельно)
final class ContentPresenter: ContentPresenterProtocol {
    
    // Список ближайших станций:
    func nearestStations() {
        guard let serverURL = try? Servers.server1() else { return }
        
        let client = Client(
            serverURL: serverURL,
            transport: URLSessionTransport()
        )
        
        let service = NetworkRequestService(
            client: client,
            apikey: Constants.apiKey
        )
        
        Task {
            let stations = try await service.getNearestStations(
                lat: 59.864177,
                lng: 30.319163,
                distance: 50
            )
            print(stations)
        }
    }
    
    // Ближайший город:
    func nearestSettlement() {
        guard let serverURL = try? Servers.server1() else { return }
        
        let client = Client(
            serverURL: serverURL,
            transport: URLSessionTransport()
        )
        
        let service = NetworkRequestService(
            client: client,
            apikey: Constants.apiKey
        )
        
        Task {
            let settlement = try await service.getNearestSettlement(
                lat: 55.806627,
                lng: 37.465793
            )
            print(settlement)
        }
    }
    
    // Информация о перевозчике:
    func carrier() {
        guard let serverURL = try? Servers.server1() else { return }
        
        let client = Client(
            serverURL: serverURL,
            transport: URLSessionTransport()
        )
        
        let service = NetworkRequestService(
            client: client,
            apikey: Constants.apiKey
        )
        
        Task {
            let carrier = try await service.getCarrier(code: "115")
            print(carrier)
        }
    }
    
    // Копирайт Яндекс Расписаний:
    func copyright() {
        guard let serverURL = try? Servers.server1() else { return }
        
        let client = Client(
            serverURL: serverURL,
            transport: URLSessionTransport()
        )
        
        let service = NetworkRequestService(
            client: client,
            apikey: Constants.apiKey
        )
        
        Task {
            let copyright = try await service.getCopyright()
            print(copyright)
        }
    }
}
