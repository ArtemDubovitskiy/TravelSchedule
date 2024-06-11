//
//  StationCellView.swift
//  TravelSchedule
//
//  Created by Artem Dubovitsky on 28.05.2024.
//

import SwiftUI

struct StationCellView: View {
    var station: Station
    
    var body: some View {
        HStack {
            Text(station.title)
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
    StationCellView(station: MockData.mockCity[0].stations[0])
}
