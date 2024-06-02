//
//  TimeIntervalCell.swift
//  TravelSchedule
//
//  Created by Artem Dubovitsky on 02.06.2024.
//

import SwiftUI

struct TimeIntervalCell: View {
    
    var title: String
    var isSelected: Bool
    var action: () -> ()
    
    var body: some View {
        HStack {
            Text(title)
                .font(.regular17)
            Spacer()
            Button {
                action()
            } label: {
                isSelected ? Image.checkBoxOn : Image.checkBoxOff
            }
            .foregroundStyle(.ypBlackDual)
            .frame(width: 24, height: 24)
        }
        .frame(height: 60)
    }
}

#Preview {
    TimeIntervalCell(
        title: "Утро 06:00 - 12:00",
        isSelected: true,
        action: { }
    )
}
