//
//  StartScreenView.swift
//  TravelSchedule
//
//  Created by Artem Dubovitsky on 20.05.2024.
//

import SwiftUI

struct StartScreenView: View {
    @EnvironmentObject var viewModel: ScheduleViewModel
    let mockStories = MockData.mockStories
    
    var body: some View {
        VStack(spacing: 20) {
            // TODO: - Добавить обработку выбора истории для StoriesView
            PreviewStoriesView(stories: mockStories.self)
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
