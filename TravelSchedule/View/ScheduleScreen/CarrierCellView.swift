//
//  CarrierCellView.swift
//  TravelSchedule
//
//  Created by Artem Dubovitsky on 28.05.2024.
//

import SwiftUI

struct CarrierCellView: View {
    
    var schedule: Schedule
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 24)
                .foregroundStyle(.ypLightGray)
                .frame(height: 104)
            VStack(spacing: 4) {
                HStack {
                    Image(schedule.carrier.logo)
                        .resizable()
                        .frame(width: 38, height: 38)
                        .padding(.leading, 14)
                    VStack(alignment: .leading, spacing: 2) {
                        HStack {
                            Text(schedule.carrier.title)
                                .font(.regular17)
                                .foregroundStyle(.ypBlack)
                            Spacer()
                            Text(schedule.date)
                                .font(.regular12)
                                .foregroundStyle(.ypBlack)
                                .padding(.trailing, 7)
                        }
                        // TODO: Добавить локализацию
                        if let transferPoint = schedule.transferPoint {
                            Text("C пересадкой в \(transferPoint)")
                                .font(.regular12)
                                .foregroundStyle(.ypRed)
                        }
                    }
                }
                .padding(.top, 14)
                
                HStack(alignment: .center) {
                    Text(schedule.departureTime)
                        .font(.regular17)
                        .foregroundStyle(.ypBlack)
                    Rectangle()
                        .frame(height: 1)
                        .foregroundStyle(.ypGray)
                    Text(schedule.durationTime)
                        .font(.regular12)
                        .foregroundStyle(.ypBlack)
                    Rectangle()
                        .frame(height: 1)
                        .foregroundStyle(.ypGray)
                    Text(schedule.arrivalTime)
                        .font(.regular17)
                        .foregroundStyle(.ypBlack)
                }
                .padding(.horizontal, 14)
                .frame(height: 48)
            }
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    CarrierCellView(schedule: MockData.mockSchedule[0])
}
