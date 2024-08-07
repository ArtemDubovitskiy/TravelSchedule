//
//  ScheduleScreenView.swift
//  TravelSchedule
//
//  Created by Artem Dubovitsky on 29.05.2024.
//

import SwiftUI

struct ScheduleScreenView: View {
    @ObservedObject var mainSearchViewModel: MainSearchViewModel
    @ObservedObject var viewModel = ScheduleViewModel()
    @Binding var path: [Destination]
    @Environment(\.dismiss) private var dismiss
    
    // TODO: Добавить локализацию
    private let buttonText = "Уточнить время"
    
    var body: some View {
        ZStack {
            switch viewModel.state {
            case .loading:
                ProgressView()
                    .task {
                        await viewModel.getSchedule(
                            departure: mainSearchViewModel.departureStation?.code ?? "",
                            arrival: mainSearchViewModel.arrivalStation?.code ?? ""
                        )
                    }
            case .content:
                VStack {
                    Text(mainSearchViewModel.scheduleText)
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
                        RouteFilterScreenView(viewModel: viewModel)
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
            case.error:
                ErrorView(errorType: viewModel.errorType)
            }
        }
        .toolbar(.hidden, for: .tabBar)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea(.all, edges: .bottom)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    mainSearchViewModel.clearRouteResult()
                    viewModel.clearScheduleResult()
                    path.removeAll()
                    dismiss()
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
        ScheduleScreenView(
            mainSearchViewModel: MainSearchViewModel(),
            path: .constant([])
        )
    }
}
