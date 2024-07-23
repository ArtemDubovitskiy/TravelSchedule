//
//  PreviewStoriesView.swift
//  TravelSchedule
//
//  Created by Artem Dubovitsky on 20.05.2024.
//

import SwiftUI

struct PreviewStoriesView: View {
    @State private var isPresented = false
    @ObservedObject var viewModel = StoriesViewModel()
    
    private let storiesHeight: Double = 188
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 12) {
                ForEach(0..<viewModel.stories.count, id: \.self) {
                    index in
                    PreviewStoryCellView(
                        story: viewModel.stories[index].stories[0],
                        isReadStory: viewModel.stories[index].isRead
                    )
                    .onTapGesture {
                        isPresented = true
                        viewModel.selectedStory = index
                    }
                    .fullScreenCover(
                        isPresented: $isPresented,
                        content: {
                            StoriesView(
                                stories: viewModel.stories[viewModel.selectedStory].stories,
                                isReadStories: {
                                    viewModel.stories[viewModel.selectedStory].isRead = true
                                }
                            )
                        }
                    )
                }
            }
//            .environmentObject(viewModel)
            .padding(.leading, 16)
            .frame(height: storiesHeight)
            .frame(maxWidth: .infinity)
        }
    }
}

#Preview {
    PreviewStoriesView()
}
