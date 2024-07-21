//
//  StationsListRequestService.swift
//  TravelSchedule
//
//  Created by Artem Dubovitsky on 21.07.2024.
//
import OpenAPIRuntime
import OpenAPIURLSession
import Foundation

typealias Stations = Components.Schemas.StationsList

protocol StationsListRequestServiceProtocol {
    func getStationsList() async throws -> Stations
}

actor StationsListRequestService: StationsListRequestServiceProtocol {
    
    private let client: Client
    private let apikey: String
    
    init(client: Client,
         apikey: String
    ) {
        self.client = client
        self.apikey = apikey
    }
    
    func getStationsList() async throws -> Stations {
        let response = try await client.getStationsList(query: .init(
            apikey: apikey
        ))
        let httpBody = try response.ok.body.html
        let data = try await Data(collecting: httpBody, upTo: 100 * 1024 * 1024)
        let stationList = try JSONDecoder().decode(Stations.self, from: data)
        return stationList
    }
}
