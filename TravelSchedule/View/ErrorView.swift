//
//  ErrorView.swift
//  TravelSchedule
//
//  Created by Artem Dubovitsky on 07.05.2024.
//
import SwiftUI

struct ErrorView: View {
    var errorType: ErrorType
    
    var body: some View {
        VStack(spacing: 16) {
            Spacer()
            Image(errorType.image)
            Text(errorType.text)
                .font(.bold24)
                .foregroundStyle(.ypBlackDual)
            Spacer()
        }
    }
}

#Preview {
    ErrorView(errorType: .networkConnecting)
}
