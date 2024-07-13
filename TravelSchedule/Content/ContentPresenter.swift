//
//  ContentPresenter.swift
//  TravelSchedule
//
//  Created by Artem Dubovitsky on 12.03.2024.
//
import Foundation
import OpenAPIURLSession

protocol ContentPresenterProtocol: AnyObject {
    func search()
    func schedule()
    func threads()
    func nearestStations()
    func nearestSettlement()
    func carrier()
    func stationsList()
    func copyright()
}

final class ContentPresenter: ContentPresenterProtocol {
    
    // Расписание рейсов между станциями:
    func search() {
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
            let search = try await service.getSearch(
                from: "s9600213",
                to: "s9623547"
            )
            print(search)
        }
    }
    
    // Расписание рейсов по станции:
    func schedule() {
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
            let schedule = try await service.getSchedule(
                station: "s9600213",
                date: "2024-03-15"
            )
            print(schedule)
        }
    }
    
    // Список станций следования:
    func threads() {
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
            let threads = try await service.getThread(
                uid: "6802_0_2006004_g24_4"
            )
            print(threads)
        }
    }
    
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
    
    // Список всех доступных станций:
    func stationsList() {
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
            let stationList = try await service.getStationsList()
            guard let countriesCount = stationList.countries?.count else { return }
            print("Countries count: \(countriesCount)") // Кол-во стран для ускорения процесса
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
