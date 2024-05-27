//
//  CityCellView.swift
//  TravelSchedule
//
//  Created by Artem Dubovitsky on 27.05.2024.
//

import SwiftUI

struct CityCellView: View {
    var city: City
    
    var body: some View {
        HStack {
            Text(city.title)
                .font(.regular17)
                .multilineTextAlignment(.leading)
                .foregroundStyle(.ypBlackDual)
            Spacer()
            Image.chevronForward
                .foregroundStyle(.ypBlackDual)
                .frame(width: 24,height: 24)
        }
        .frame(height: 60)
    }
}

#Preview {
    CityCellView(city: MockData.mockCity[1])
}
