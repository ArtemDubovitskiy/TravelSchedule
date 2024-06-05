//
//  StartTabView.swift
//  TravelSchedule
//
//  Created by Artem Dubovitsky on 22.05.2024.
//

import SwiftUI

struct StartTabView: View {
    @AppStorage("isDarkScheme") var isDarkScheme: Bool = false
    @StateObject var viewModel = ScheduleViewModel(cities: [], schedule: [])
    
    @State private var selectedTab = 0
    
    var body: some View {
        NavigationStack {
            TabView(selection: $selectedTab) {
                VStack {
                    StartScreenView()
                    Divider()
                        .padding(5)
                }
                .tabItem {
                    Image.schuedleTab
                }
                .tag(0)
                
                VStack {
                    SettingsScreenView(isDarkScheme: $isDarkScheme)
                    Divider()
                        .padding(5)
                }
                .tabItem {
                    Image.settingsTab
                }
                .tag(1)
            }
            .tint(.ypBlackDual)
        }
        .environmentObject(viewModel)
    }
}

#Preview {
    StartTabView()
}
