//
//  PreviewStoriesView.swift
//  TravelSchedule
//
//  Created by Artem Dubovitsky on 20.05.2024.
//

import SwiftUI

struct PreviewStoriesView: View {
    @State private var isPresented = false
    @EnvironmentObject var viewModel: ScheduleViewModel
    
    private let storiesHeight: Double = 188
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 12) {
                ForEach(viewModel.stories) {
                    index in
                    PreviewStoryCellView(
                        story: index.stories[0],
                        isReadStory: index.isRead
                    )
                    .onTapGesture {
                        isPresented = true
                        viewModel.selectedStories = index
                    }
                    .fullScreenCover(
                        isPresented: $isPresented,
                        content: {
                            StoriesView(
                                stories: viewModel.selectedStories?.stories ?? []
                            )
                        }
                    )
                }
            }
            .environmentObject(viewModel)
            .padding(.leading, 16)
            .frame(height: storiesHeight)
            .frame(maxWidth: .infinity)
        }
    }
}

#Preview {
    PreviewStoriesView()
}
