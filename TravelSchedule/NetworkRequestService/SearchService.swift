//
//  SearchService.swift
//  TravelSchedule
//
//  Created by Artem Dubovitsky on 22.07.2024.
//
import Foundation
import OpenAPIURLSession

actor SearchService: Sendable {
    
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
//            let date = segment.start_date
            let departure = segment.departure
            let arrival = segment.arrival
            let transfers = segment.has_transfers ?? false
            let transfersTitle = transfers ? "С пересадкой в: \(segment.stops ?? "")" : ""
            let duration = segment.duration
            guard let carrier = segment.thread?.carrier else { return nil }
            
            return Schedule(
                date: departure ?? "",
                departureTime: timeToHour(from: departure),
                arrivalTime: timeToHour(from: arrival),
                durationTime: durationToTime(from: duration),
                transferPoint: transfersTitle,
                carrier: Carrier(
                    title: carrier.title ?? "",
                    logoSvg: carrier.logo_svg ?? "",
                    logo: carrier.logo ?? "",
                    email: carrier.email ?? "",
                    phone: carrier.phone ?? ""
                )
            )
        }
        guard let schudules = schudule else { return [] }
        return schudules
    }
    // MARK: - Private Methods
    // TODO: исправить методы
    private func timeToHour(from: String?) -> String {
        guard let from else { return "" }
        let time = String(from.dropLast(3))
        return time
    }
    
    private func durationToTime(from duration_seconds: Int?) -> String {
        guard let duration = duration_seconds else { return "" }
        let durationDouble = Double(duration)
        guard 
            let time = DateComponentsFormatter.formatter.string(from: durationDouble)
        else { return "" }
        return time
    }
}
