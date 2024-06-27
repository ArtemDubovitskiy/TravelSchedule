//
//  StoryView.swift
//  TravelSchedule
//
//  Created by Artem Dubovitsky on 28.06.2024.
//

import SwiftUI

struct StoryView: View {
    
    private let stubImage = "Big02"
    private let stubText = "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text "
    
    var body: some View {
        ZStack {
            Image(stubImage)
                .resizable()
                .scaledToFill()
                .clipShape(RoundedRectangle(cornerRadius: 40))
                .padding(.top, 7)
                .padding(.bottom, 17)
            
            VStack(alignment: .leading, spacing: 16) {
                Spacer()
                Text(stubText)
                    .font(.bold34)
                    .lineLimit(2)
                Text(stubText)
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
    StoryView()
}
