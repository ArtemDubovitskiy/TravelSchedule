//
//  SearchRequestService.swift
//  TravelSchedule
//
//  Created by Artem Dubovitsky on 22.07.2024.
//
import OpenAPIRuntime
import OpenAPIURLSession
import Foundation

typealias SearchRoutes = Components.Schemas.RoutesList

protocol SearchRequestServiceProtocol {
    func getSearch(from: String, to: String, date: String) async throws -> SearchRoutes
}

actor SearchRequestService: SearchRequestServiceProtocol, Sendable {
    
    private let client: Client
    private let apikey: String
    
    init(client: Client,
         apikey: String
    ) {
        self.client = client
        self.apikey = apikey
    }
    // Расписание рейсов между станциями:
    func getSearch(from: String, to: String, date: String) async throws -> SearchRoutes {
        let response = try await client.getSearch(query: .init(
            apikey: apikey,
            from: from,
            to: to,
            date: date,
            transfers: true
        ))
        return try response.ok.body.json
    }
}
