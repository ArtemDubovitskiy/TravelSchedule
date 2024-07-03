//
//  CloseButton.swift
//  TravelSchedule
//
//  Created by Artem Dubovitsky on 27.06.2024.
//

import SwiftUI

struct CloseButton: View {
    let action: () -> Void
    private let closeButtonSize: CGFloat = 30
    
    var body: some View {
        Button {
            action()
        } label: {
            Image.closeImage
                .resizable()
                .scaledToFit()
                .frame(width: closeButtonSize, height: closeButtonSize)
                .foregroundStyle(.ypBlack)
        }
    }
}

#Preview {
    CloseButton(action: { } )
}
