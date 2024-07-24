//
//  StationsListService.swift
//  TravelSchedule
//
//  Created by Artem Dubovitsky on 21.07.2024.
//
import Foundation
import OpenAPIURLSession

actor StationsListService: Sendable {
    // Список всех доступных станций:
    func stationsList() async throws -> [City] {
        guard let serverURL = try? Servers.server1() else {
            return [City(title: "", stations: [])]
        }
        
        let client = Client(
            serverURL: serverURL,
            transport: URLSessionTransport()
        )
        
        let service = StationsListRequestService(
            client: client,
            apikey: Constants.apiKey
        )
        
        let allStationsList = try await service.getStationsList()
        let ruStationsList = allStationsList.countries?.filter { $0.title == "Россия" }
        
        let stations = ruStationsList?.flatMap { russian -> [City] in
            guard let regions = russian.regions else { return [] }
            return regions.flatMap { region -> [City] in
                
                guard let region = region.settlements else { return [] }
                
                return region.compactMap { settlement -> City? in
                    guard let cityTitle = settlement.title,
                          cityTitle != "" else { return nil }
                    guard let stations = settlement.stations else { return nil }
                    
                    let stationInCity = stations.compactMap { station -> Station? in
                        guard let stationTitle = station.title,
                              stationTitle != "",
                              station.transport_type == "train",
                              let stationCode = station.codes?.yandex_code
                        else { return nil }
                        return Station(title: stationTitle, code: stationCode)
                    }
                    
                    return City(
                        title: cityTitle,
                        stations: stationInCity.sorted { $0.title < $1.title }
                    )
                }
            }
        }
        guard let allStations = stations else { return [] }
        return allStations
    }
}

