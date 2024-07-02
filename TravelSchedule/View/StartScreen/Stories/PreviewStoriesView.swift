//
//  PreviewStoriesView.swift
//  TravelSchedule
//
//  Created by Artem Dubovitsky on 20.05.2024.
//

import SwiftUI

struct PreviewStoriesView: View {
    var stories: [Stories]
    @State private var isPresented = false
    @State private var selectedStory: [Story]?
    
    private let storiesHeight: Double = 188
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 12) {
                ForEach(stories) {
                    index in
                    PreviewStoryCellView(
                        story: index.stories[0],
                        isReadStory: false
                    )
                    .onTapGesture {
                        isPresented = true
                        selectedStory = index.stories
                    }
                    .fullScreenCover(
                        isPresented: $isPresented,
                        content: {
                            StoriesView(
                                stories: selectedStory ?? []
                            )
                        }
                    )
                }
            }
            .padding(.leading, 16)
            .frame(height: storiesHeight)
            .frame(maxWidth: .infinity)
        }
    }
}

#Preview {
    PreviewStoriesView(stories: MockData.mockStories)
}
