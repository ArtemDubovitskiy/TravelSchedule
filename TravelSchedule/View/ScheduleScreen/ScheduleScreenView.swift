//
//  ScheduleScreenView.swift
//  TravelSchedule
//
//  Created by Artem Dubovitsky on 29.05.2024.
//

import SwiftUI

struct ScheduleScreenView: View {
    @StateObject var viewModel: ScheduleViewModel

    @Environment(\.dismiss) private var dismiss // заглушка
    
    // TODO: Добавить локализацию
    private let buttonText = "Уточнить время"
    
    var body: some View {
        ZStack {
            VStack {
                Text("Москва (Ярославский вокзал) → Санкт Петербург (Балтийский вокзал)")
                    .font(.bold24)
                    .foregroundStyle(.ypBlackDual)
                    .padding(.horizontal, 16)
                    .padding(.top, 10)
                    .multilineTextAlignment(.leading)
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVStack(spacing: 8) {
                        ForEach(viewModel.schedule) { route in
                            CarrierCellView(schedule: route)
                        }
                    }
                }
                .padding(.bottom, 16)
            }
            
            VStack {
                Spacer()
                Button {
                    // TODO: Добавить переход на экран фильтра
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 16)
                            .foregroundStyle(.ypBlue)
                            .frame(height: 60)
                        HStack(alignment: .center, spacing: 4) {
                            Text(buttonText)
                                .font(.bold17)
                                .foregroundStyle(.ypWhite)
                            // TODO: Добавить обработку фильтрации
                            Circle()
                                .fill(.ypRed)
                                .frame(width: 8, height: 8)
                        }
                    }
                    .padding(.bottom, 24)
                    .padding(.horizontal, 16)
                }
            }
        }
        .toolbar(.hidden, for: .tabBar)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea(.all, edges: .bottom)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    dismiss() // заглушка
                } label: {
                    Image.chevronBackward
                        .foregroundStyle(.ypBlackDual)
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        ScheduleScreenView(viewModel: ScheduleViewModel(schedule: MockData.mockSchedule))
    }
}
