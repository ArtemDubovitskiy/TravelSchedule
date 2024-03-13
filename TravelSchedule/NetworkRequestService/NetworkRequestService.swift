//
//  NetworkRequestService.swift
//  TravelSchedule
//
//  Created by Artem Dubovitsky on 12.03.2024.
//
import OpenAPIRuntime
import OpenAPIURLSession

typealias NearestStations = Components.Schemas.Stations
typealias Carrier = Components.Schemas.Carriers
typealias CarrierSystem = Operations.getCarrier.Input.Query.systemPayload
typealias CopyrightSchedule = Components.Schemas.Copyright

protocol NetworkRequestServiceProtocol {
    func getNearestStations(lat: Double, lng: Double, distance: Int) async throws -> NearestStations
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
