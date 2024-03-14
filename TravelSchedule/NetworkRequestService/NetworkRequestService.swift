//
//  NetworkRequestService.swift
//  TravelSchedule
//
//  Created by Artem Dubovitsky on 12.03.2024.
//
import OpenAPIRuntime
import OpenAPIURLSession

typealias SearchRoutes = Components.Schemas.RoutesList
typealias Schedule = Components.Schemas.ScheduleStation
typealias Threads = Components.Schemas.ThreadList
typealias NearestStations = Components.Schemas.Stations
typealias NearestSettlement = Components.Schemas.Settlement
typealias Carrier = Components.Schemas.Carriers
typealias CarrierSystem = Operations.getCarrier.Input.Query.systemPayload
typealias CopyrightSchedule = Components.Schemas.Copyright

protocol NetworkRequestServiceProtocol {
    func getSearch(from: String, to: String) async throws -> SearchRoutes
    func getSchedule(station: String, date: String) async throws -> Schedule
    func getThread(uid: String) async throws -> Threads
    func getNearestStations(lat: Double, lng: Double, distance: Int) async throws -> NearestStations
    func getNearestSettlement(lat: Double, lng: Double) async throws -> NearestSettlement
    func getCarrier(code: String, system: CarrierSystem) async throws -> Carrier
    func getCopyright() async throws -> CopyrightSchedule
}

final class NetworkRequestService: NetworkRequestServiceProtocol {

    private let client: Client
    private let apikey: String
    
    init(client: Client, apikey: String) {
        self.client = client
        self.apikey = apikey
    }
    // Расписание рейсов между станциями:
    func getSearch(from: String, to: String) async throws -> SearchRoutes {
        let response = try await client.getSearch(query: .init(
            apikey: apikey,
            from: from,
            to: to
        ))
        return try response.ok.body.json
    }
    
    // Расписание рейсов по станции:
    func getSchedule(station: String, date: String) async throws -> Schedule {
        let response = try await client.getSchedule(query: .init(
            apikey: apikey,
            station: station,
            date: date
        ))
        return try response.ok.body.json
    }
    
    // Список станций следования:
    func getThread(uid: String) async throws -> Threads {
        let response = try await client.getThread(query: .init(
            apikey: apikey,
            uid: uid
        ))
        return try response.ok.body.json
    }
    
    // Список ближайших станций:
    func getNearestStations(lat: Double, lng: Double, distance: Int) async throws -> NearestStations {
        let response = try await client.getNearestStations(query: .init(
            apikey: apikey,
            lat: lat,
            lng: lng,
            distance: distance
        ))
        return try response.ok.body.json
    }
    
    // Ближайший город:
    func getNearestSettlement(lat: Double, lng: Double) async throws -> NearestSettlement {
        let response = try await client.getNearestSettlement(query: .init(
            apikey: apikey,
            lat: lat,
            lng: lng
        ))
        return try response.ok.body.json
    }
    
    // Информация о перевозчике:
    func getCarrier(code: String, system: CarrierSystem = .yandex) async throws -> Carrier {
        let response = try await client.getCarrier(query: .init(
            apikey: apikey,
            code: code,
            system: system
        ))
        return try response.ok.body.json
    }
    
    // Копирайт Яндекс Расписаний:
    func getCopyright() async throws -> CopyrightSchedule {
        let response = try await client.getCopyright(query: .init(
            apikey: apikey
        ))
        return try response.ok.body.json
    }
}
