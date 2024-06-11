//
//  StoryCellView.swift
//  TravelSchedule
//
//  Created by Artem Dubovitsky on 20.05.2024.
//

import SwiftUI

struct StoryCellView: View {
    
    let story: Story
    let isReadStory: Bool
    
    private let imageHeight: Double = 140
    private let imageWidth: Double = 92
    private let textHeight: Double = 45
    private let textWidth: Double = 76
    
    var body: some View {
        ZStack {
            Image(story.smallImage)
                .resizable()
                .scaledToFit()
                .frame(
                    width: imageWidth,
                    height: imageHeight
                )
                .cornerRadius(16)
                .opacity(isReadStory ? 0.5 : 1)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(
                            Color.ypBlue,
                            lineWidth: isReadStory ? 0 : 4))
            
            Text(story.title)
                .font(.regular12)
                .multilineTextAlignment(.leading)
                .lineLimit(3)
                .foregroundStyle(.ypWhite)
                .frame(width: textWidth,
                       height: textHeight)
                .padding(.top, 83)
                .padding(.bottom, 12)
        }
    }
}

#Preview {
    StoryCellView(
        story: MockData.mockStories[0].self,
        isReadStory: false
    )
}
