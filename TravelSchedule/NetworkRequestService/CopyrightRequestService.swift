//
//  CopyrightRequestService.swift
//  TravelSchedule
//
//  Created by Artem Dubovitsky on 16.07.2024.
//
import OpenAPIRuntime
import OpenAPIURLSession
import Foundation

typealias CopyrightSchedule = Components.Schemas.Copyright

protocol CopyrightRequestServiceProtocol {
    func getCopyright() async throws -> CopyrightSchedule
}

actor CopyrightRequestService: CopyrightRequestServiceProtocol {
    
    private let client: Client
    private let apikey: String
    
    init(client: Client, 
         apikey: String
    ) {
        self.client = client
        self.apikey = apikey
    }
    
    func getCopyright() async throws -> CopyrightSchedule {
        let response = try await client.getCopyright(query: .init(
            apikey: apikey
        ))
        return try response.ok.body.json
    }
}
