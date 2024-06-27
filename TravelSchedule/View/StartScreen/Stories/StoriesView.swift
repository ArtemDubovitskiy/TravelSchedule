//
//  StoriesView.swift
//  TravelSchedule
//
//  Created by Artem Dubovitsky on 27.06.2024.
//

import SwiftUI

struct StoriesView: View {
    
    var body: some View {
        Color.ypBlack
            .ignoresSafeArea()
            .overlay {
                ZStack(alignment: .topTrailing) {
                    StoryView()
                    // TODO: - изменить на StoriesProgressBarView
                    ProgressBarView(numberOfSections: 3, progress: 0.2)
                        .padding(.top, 35)
                        .padding(.horizontal, 12)
                    // TODO: - добавить действие для кнопки
                    CloseButton(action: { })
                        .padding(.top, 57)
                        .padding(.trailing, 12)
                }
            }
    }
}

#Preview {
    StoriesView()
}
