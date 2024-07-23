//
//  CopyrightService.swift
//  TravelSchedule
//
//  Created by Artem Dubovitsky on 16.07.2024.
//
import Foundation
import OpenAPIURLSession

actor CopyrightService: Sendable {
    
    // Копирайт Яндекс Расписаний:
    func copyright() async throws -> String? {
        guard let serverURL = try? Servers.server1() else { return "" }
        
        let client = Client(
            serverURL: serverURL,
            transport: URLSessionTransport()
        )

        let service = CopyrightRequestService(
            client: client,
            apikey: Constants.apiKey
        )
        
        let copyright = try await service.getCopyright()
        return copyright.copyright?.text
    }
}
