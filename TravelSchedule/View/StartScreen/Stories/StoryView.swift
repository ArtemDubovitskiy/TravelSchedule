//
//  StoryView.swift
//  TravelSchedule
//
//  Created by Artem Dubovitsky on 28.06.2024.
//

import SwiftUI

struct StoryView: View {
    
    var story: Story
    
    var body: some View {
        ZStack {
            Image(story.image)
                .resizable()
                .scaledToFill()
                .clipShape(RoundedRectangle(cornerRadius: 40))
                .padding(.top, 7)
                .padding(.bottom, 17)
            
            VStack(alignment: .leading, spacing: 16) {
                Spacer()
                Text(story.title)
                    .font(.bold34)
                    .lineLimit(2)
                Text(story.description)
                    .font(.regular20)
                    .lineLimit(3)
            }
            .foregroundStyle(.ypWhite)
            .padding(.horizontal, 16)
            .padding(.bottom, 57)
        }
    }
}

#Preview {
    StoryView(story: MockData.mockStories[0].stories[0])
}
