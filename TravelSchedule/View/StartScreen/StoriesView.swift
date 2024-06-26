//
//  StoriesView.swift
//  TravelSchedule
//
//  Created by Artem Dubovitsky on 20.05.2024.
//

import SwiftUI

struct StoriesView: View {
    var stories: [Story]
    
    private let storiesHeight: Double = 188
    // TODO: - Добавить обработку выбора истории для StoriesView
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 12) {
                ForEach(stories) { story in
                    StoryCellView(story: story, isReadStory: false)
                }
            }
            .padding(.leading, 16)
            .frame(height: storiesHeight)
            .frame(maxWidth: .infinity)
        }
    }
}

#Preview {
    StoriesView(stories: MockData.mockStories.self)
}
