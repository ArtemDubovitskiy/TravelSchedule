//
//  MaskView.swift
//  TravelSchedule
//
//  Created by Artem Dubovitsky on 27.06.2024.
//
import SwiftUI

struct MaskView: View {
    let numberOfSections: Int
    
    var body: some View {
        HStack(spacing: 6) {
            ForEach(0..<numberOfSections, id: \.self) { _ in
                MaskFragmentView()
            }
        }
    }
}

#Preview {
    Color.ypBlack
        .ignoresSafeArea()
        .overlay {
            MaskView(numberOfSections: 3)
                .padding(.horizontal, 12)
        }
}
