//
//  TravelScheduleApp.swift
//  TravelSchedule
//
//  Created by Artem Dubovitsky on 10.03.2024.
//

import SwiftUI

@main
struct TravelScheduleApp: App {
    
    @AppStorage("isDarkScheme") private var isDarkScheme: Bool = false
    
    var body: some Scene {
        WindowGroup {
            StartTabView()
                .preferredColorScheme(isDarkScheme ? .dark : .light)
        }
    }
}
