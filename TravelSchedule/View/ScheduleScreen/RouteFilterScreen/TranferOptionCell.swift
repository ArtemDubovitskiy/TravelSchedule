//
//  TranferOptionCell.swift
//  TravelSchedule
//
//  Created by Artem Dubovitsky on 02.06.2024.
//

import SwiftUI

struct TranferOptionCell: View {
    
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
                isSelected ? Image.radioButtonOn : Image.radioButtonOff
            }
            .foregroundStyle(.ypBlackDual)
            .frame(width: 24, height: 24)
        }
        .frame(maxWidth: .infinity, maxHeight: 60, alignment: .leading)
    }
}

#Preview {
    TranferOptionCell(
        title: "Да",
        isSelected: false,
        action: { }
    )
}
