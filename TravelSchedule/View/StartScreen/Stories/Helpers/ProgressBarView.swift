//
//  ProgressBarView.swift
//  TravelSchedule
//
//  Created by Artem Dubovitsky on 27.06.2024.
//
import SwiftUI

struct ProgressBarView: View {
    
    let numberOfSections: Int
    let progress: CGFloat
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: ProgressBarConstants.progressBarCornerRadius)
                    .frame(
                        width: geometry.size.width,
                        height: ProgressBarConstants.progressBarHeight
                    )
                    .foregroundStyle(.ypWhite)
                RoundedRectangle(cornerRadius: ProgressBarConstants.progressBarCornerRadius)
                    .frame(
                        width: min(progress * geometry.size.width, geometry.size.width),
                        height: ProgressBarConstants.progressBarHeight
                    )
                    .foregroundStyle(Color.ypBlue)
            }
            .mask {
                MaskView(numberOfSections: numberOfSections)
            }
        }
    }
}

#Preview {
    Color.ypBlack
        .ignoresSafeArea()
        .overlay {
            ProgressBarView(
                numberOfSections: 4,
                progress: 0.35)
            .padding()
        }
}
