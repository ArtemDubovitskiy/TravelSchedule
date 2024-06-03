//
//  RouteFilterScreenView.swift
//  TravelSchedule
//
//  Created by Artem Dubovitsky on 02.06.2024.
//

import SwiftUI

struct RouteFilterScreenView: View {
    
    @State private var selectedIntervals: Set<TimeFilters> = []
    @State private var selectedTransferOptions: Int?
    
    @Environment(\.dismiss) private var dismiss
    
    // TODO: Добавить локализацию
    private let departureTimeText = "Время отправления"
    private let tranferOptionText = "Показывать варианты с пересадками"
    private let buttonText = "Применить"
    
    var body: some View {
        VStack(spacing: 16) {
            Text(departureTimeText)
                .font(.bold24)
                .foregroundStyle(.ypBlackDual)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 16)
            
            VStack(spacing: 0) {
                ForEach(TimeFilters.allCases, id: \.self) {
                    timeInterval in
                    TimeIntervalCell(
                        title: timeInterval.title,
                        isSelected: selectedIntervals.contains(timeInterval),
                        action: {
                            toggleSelection(at: timeInterval)
                        }
                    )
                }
            }
            
            Text(tranferOptionText)
                .font(.bold24)
                .foregroundStyle(.ypBlackDual)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack(spacing: 0) {
                ForEach(TransferFilters.allCases, id: \.self) {
                    showTransfers in
                    TranferOptionCell(
                        title: showTransfers.title,
                        isSelected: selectedTransferOptions == showTransfers.hashValue,
                        action: {
                            selectedTransferOptions = showTransfers.hashValue
                        }
                    )
                }
            }
        }
        .padding(.horizontal, 16)
        .toolbar(.hidden, for: .tabBar)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea(.all, edges: .bottom)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image.chevronBackward
                        .foregroundStyle(.ypBlackDual)
                }
            }
        }
        Spacer()
        
        if !selectedIntervals.isEmpty &&
            selectedTransferOptions != nil {
            Button {
                // TODO: Добавить обработку нажатия кнопки
                dismiss()
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .foregroundStyle(.ypBlue)
                        .frame(height: 60)
                    HStack(alignment: .center, spacing: 4) {
                        Text(buttonText)
                            .font(.bold17)
                            .foregroundStyle(.ypWhite)
                    }
                }
                .padding(.bottom, 24)
                .padding(.horizontal, 16)
            }
        }
    }
    
    private func toggleSelection(at timeInterval: TimeFilters) {
        if selectedIntervals.contains(timeInterval) {
            selectedIntervals.remove(timeInterval)
        } else {
            selectedIntervals.insert(timeInterval)
        }
    }
}

#Preview {
    NavigationStack {
        RouteFilterScreenView()
    }
}
