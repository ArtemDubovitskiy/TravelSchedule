//
//  ScheduleScreenView.swift
//  TravelSchedule
//
//  Created by Artem Dubovitsky on 29.05.2024.
//

import SwiftUI

struct ScheduleScreenView: View {
    @Binding var path: [Destination]
    @EnvironmentObject var viewModel: ScheduleViewModel
    @Environment(\.dismiss) private var dismiss
    
    // TODO: Добавить локализацию
    private let buttonText = "Уточнить время"
    
    var body: some View {
        switch viewModel.state {
        case .loading:
            ProgressView()
            
        case .content:
            ZStack {
                VStack {
                    Text(viewModel.scheduleText)
                        .font(.bold24)
                        .foregroundStyle(.ypBlackDual)
                        .padding(.horizontal, 16)
                        .padding(.top, 10)
                        .multilineTextAlignment(.leading)
                    
                    if viewModel.filterSchedule.isEmpty {
                        Spacer()
                        Text("Вариантов нет")
                            .font(.bold24)
                            .foregroundStyle(.ypBlackDual)
                            .padding(.horizontal)
                        Spacer()
                        Spacer()
                    } else {
                        ScrollView(.vertical, showsIndicators: false) {
                            LazyVStack(spacing: 8) {
                                ForEach(viewModel.filterSchedule) { route in
                                    NavigationLink {
                                        CarrierInfoScreenView(carrier: route.carrier)
                                    } label: {
                                        CarrierCellView(schedule: route)
                                    }
                                }
                            }
                        }
                        .padding(.bottom, 16)
                    }
                }
                
                VStack {
                    Spacer()
                    NavigationLink {
                        RouteFilterScreenView()
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 16)
                                .foregroundStyle(.ypBlue)
                                .frame(height: 60)
                            HStack(alignment: .center, spacing: 4) {
                                Text(buttonText)
                                    .font(.bold17)
                                    .foregroundStyle(.ypWhite)
                                if viewModel.isFilteredSchedule {
                                    Circle()
                                        .fill(.ypRed)
                                        .frame(width: 8, height: 8)
                                }
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.bottom, 24)
                    }
                }
                .padding(.bottom, 24)
            }
            .task {
                await viewModel.getSchedule()
            }
            .environmentObject(viewModel)
            .toolbar(.hidden, for: .tabBar)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .ignoresSafeArea(.all, edges: .bottom)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        viewModel.clearRouteResult()
                        path.removeAll()
                        dismiss()
                    } label: {
                        Image.chevronBackward
                            .foregroundStyle(.ypBlackDual)
                    }
                }
            }
            
        case.error:
            ErrorView(errorType: viewModel.errorType)
        }
    }
}

#Preview {
    NavigationStack {
        ScheduleScreenView(
            path: .constant([])).environmentObject(ScheduleViewModel(cities: []))
    }
}
