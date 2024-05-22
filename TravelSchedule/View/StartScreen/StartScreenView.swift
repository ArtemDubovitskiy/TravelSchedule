//
//  StartScreenView.swift
//  TravelSchedule
//
//  Created by Artem Dubovitsky on 20.05.2024.
//

import SwiftUI

struct StartScreenView: View {
    
    let mockStories = MockData.mockStories
    
    var body: some View {
        
        VStack(spacing: 20) {
            // TODO: - Добавить обработку выбора истории для StoriesView
            StoriesView(stories: mockStories.self)
            MainSearchView()
            Spacer()
        }
    }
}

#Preview {
    StartScreenView()
}
