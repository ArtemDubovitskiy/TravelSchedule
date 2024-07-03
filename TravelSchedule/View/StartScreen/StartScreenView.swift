//
//  StartScreenView.swift
//  TravelSchedule
//
//  Created by Artem Dubovitsky on 20.05.2024.
//

import SwiftUI

struct StartScreenView: View {
    @EnvironmentObject var viewModel: ScheduleViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            PreviewStoriesView()
            MainSearchView()
            Spacer()
        }
        .environmentObject(viewModel)
    }
}

#Preview {
    StartScreenView()
        .environmentObject(ScheduleViewModel(cities: []))
}
