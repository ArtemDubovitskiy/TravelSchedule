//
//  StoriesView.swift
//  TravelSchedule
//
//  Created by Artem Dubovitsky on 27.06.2024.
//

import SwiftUI

struct StoriesView: View {
    
    let stories: [Story]
    private var timerConfiguration: TimerConfiguration {
        .init(storiesCount: stories.count)
    }
    
    @State var currentProgress: CGFloat = 0
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        Color.ypBlack
            .ignoresSafeArea()
            .overlay {
                ZStack(alignment: .topTrailing) {
                    // TODO: - изменить на StoriesTabView
                    StoryView(story: stories[0]) // заглушка
                    
                    StoriesProgressBarView(
                        storiesCount: stories.count,
                        timerConfiguration: timerConfiguration,
                        currentProgress: $currentProgress
                    )
                    
                    CloseButton(action: {
                        dismiss()
                    })
                    .padding(.top, 57)
                    .padding(.trailing, 12)
                }
            }
    }
}

#Preview {
    StoriesView(stories: MockData.mockStories[0].stories)
}
