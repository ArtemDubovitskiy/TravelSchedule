//
//  SearchService.swift
//  TravelSchedule
//
//  Created by Artem Dubovitsky on 22.07.2024.
//
import Foundation
import OpenAPIURLSession

final class SearchService {
    
    func search(from: String, to: String, date: String) async throws -> [Schedule] {
        guard let serverURL = try? Servers.server1() else {
            return []
        }
        
        let client = Client(
            serverURL: serverURL,
            transport: URLSessionTransport()
        )
        
        let service = SearchRequestService(
            client: client,
            apikey: Constants.apiKey
        )
        
        let search = try await service.getSearch(
            from: from,
            to: to,
            date: date
        )
        
        let schudule = search.segments?.compactMap { segment -> Schedule? in
            let departure = segment.departure
            let arrival = segment.arrival
            let transfers = segment.has_transfers ?? false
            let transfersTitle = segment.stops
            let duration = segment.duration
            guard let carrier = segment.thread?.carrier else { return nil }
            
            // TODO: - исправить после рефакторинга
            return Schedule(
                date: departure ?? "",
                departureTime: departure ?? "",
                arrivalTime: arrival ?? "",
                durationTime: durationToTime(from: duration),
                transferPoint: transfersTitle ?? "",
                carrier: Carrier(
                    title: carrier.title ?? "",
                    logo: "", // carrier.logo ?? ""
                    logoFull: "", // carrier.logo_svg ?? ""
                    email: carrier.email ?? "",
                    phone: carrier.phone ?? ""
                )
            )
        }
        guard let schudules = schudule else { return [] }
        return schudules
    }
    // MARK: - Private Methods
    private func durationToTime(from duration_seconds: Int?) -> String {
        guard let duration = duration_seconds else { return "" }
        let durationDouble = Double(duration)
        guard 
            let time = DateComponentsFormatter.formatter.string(from: durationDouble)
        else { return "" }
        return time
    }
}
