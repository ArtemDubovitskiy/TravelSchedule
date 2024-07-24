//
//  StartTabView.swift
//  TravelSchedule
//
//  Created by Artem Dubovitsky on 22.05.2024.
//

import SwiftUI

struct StartTabView: View {
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
                    SettingsScreenView()
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
    }
}

#Preview {
    StartTabView()
}
