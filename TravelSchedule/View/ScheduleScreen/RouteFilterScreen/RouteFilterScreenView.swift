//
//  RouteFilterScreenView.swift
//  TravelSchedule
//
//  Created by Artem Dubovitsky on 02.06.2024.
//

import SwiftUI

struct RouteFilterScreenView: View {
    @EnvironmentObject var viewModel: MainSearchViewModel
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
                        isSelected: viewModel.selectedIntervals.contains(timeInterval),
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
                        isSelected: viewModel.selectedTransferOptions == showTransfers,
                        action: {
                            viewModel.selectedTransferOptions = showTransfers
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
        
        if !viewModel.selectedIntervals.isEmpty &&
            viewModel.selectedTransferOptions != nil {
            Button {
                guard let selectOptions = viewModel.selectedTransferOptions else { return }
                viewModel.applyRoteFilters(
                    selectedIntervals: viewModel.selectedIntervals,
                    selectedTransferOptions: selectOptions
                )
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
        if viewModel.selectedIntervals.contains(timeInterval) {
            viewModel.selectedIntervals.remove(timeInterval)
        } else {
            viewModel.selectedIntervals.insert(timeInterval)
        }
    }
}

#Preview {
    NavigationStack {
        RouteFilterScreenView()
    }
}
