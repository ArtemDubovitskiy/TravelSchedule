//
//  MaskFragmentView.swift
//  TravelSchedule
//
//  Created by Artem Dubovitsky on 27.06.2024.
//
import SwiftUI

struct MaskFragmentView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: ProgressBarConstants.progressBarCornerRadius)
            .frame(height: ProgressBarConstants.progressBarHeight)
            .fixedSize(
                horizontal: false,
                vertical: true)
            .foregroundStyle(.ypWhite)
    }
}

#Preview {
    Color.ypBlack
        .ignoresSafeArea()
        .overlay {
            MaskFragmentView()
                .padding(.horizontal, 12)
        }
}
