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
    @State var currentStoryIndex: Int = 0
    @State var currentProgress: CGFloat = 0
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        Color.ypBlack
            .ignoresSafeArea()
            .overlay {
                ZStack(alignment: .topTrailing) {
                    StoriesTabView(
                        stories: stories,
                        currentStoryIndex: $currentStoryIndex
                    )
                    .onChange(of: currentStoryIndex) { [currentStoryIndex] newValue in
                        didChangeCurrentIndex(
                            oldIndex: currentStoryIndex,
                            newIndex: newValue
                        )
                    }
                    
                    StoriesProgressBarView(
                        storiesCount: stories.count,
                        timerConfiguration: timerConfiguration,
                        currentProgress: $currentProgress
                    )
                    .onChange(of: currentProgress) { newValue in
                        didChangeCurrentProgress(
                            newProgress: newValue
                        )
                    }
                    
                    CloseButton(action: {
                        dismiss()
                    })
                    .padding(.top, 57)
                    .padding(.trailing, 12)
                }
            }
            .preferredColorScheme(.dark)
    }
    // MARK: - Private Methods
    private func didChangeCurrentIndex(oldIndex: Int, newIndex: Int) {
        guard oldIndex != newIndex else { return }
        let progress = timerConfiguration.progress(for: newIndex)
        guard abs(progress - currentProgress) >= 0.01 else { return }
        withAnimation {
            currentProgress = progress
        }
    }
    
    private func didChangeCurrentProgress(newProgress: CGFloat) {
        let index = timerConfiguration.index(for: newProgress)
        guard index != currentStoryIndex else { return }
        withAnimation {
            currentStoryIndex = index
        }
    }
}

#Preview {
    StoriesView(stories: MockData.mockStories[0].stories)
}
