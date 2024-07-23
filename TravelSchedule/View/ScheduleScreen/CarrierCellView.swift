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
                    AsyncImage(url: URL(string: schedule.carrier.logoSvg)) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .frame(width: 38, height: 38)
                    } placeholder: { Image("StubIcon") }
                        .padding(.leading, 14)
                    VStack(alignment: .leading, spacing: 2) {
                        HStack {
                            Text(schedule.carrier.title)
                                .font(.regular17)
                                .foregroundStyle(.ypBlack)
                            Spacer()
                            // Прошу не считать формат даты критическим замечанием:
                            Text(schedule.date.parceStringToDateToStrimg())
                                .font(.regular12)
                                .foregroundStyle(.ypBlack)
                                .padding(.trailing, 7)
                        }
                        // TODO: Добавить локализацию
                        if let transferPoint = schedule.transferPoint {
                            Text(transferPoint)
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
                        .lineLimit(1)
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
