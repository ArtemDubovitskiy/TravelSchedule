//
//  SettingsScreenView.swift
//  TravelSchedule
//
//  Created by Artem Dubovitsky on 23.05.2024.
//

import SwiftUI

struct SettingsScreenView: View {
    @ObservedObject var viewModel = SettingsViewModel()
    // TODO: Добавить локализацию
    private let toggleText = "Темная тема"
    private let agreementText = "Пользовательское соглашение"
    //    private let apiText = "Приложение использует API «Яндекс.Расписания»"
    private let versionText = "Версия 1.0 (beta)"
    
    var body: some View {
        switch viewModel.state {
            // здесь непонятное повидение вью, но цикличная загрузка
        case .loading:
            ProgressView()
        case .content:
            // в этом варианте нет загрузки (текст подгружвается позже):
            //        case .loading, .content:
            VStack(spacing: 0) {
                HStack {
                    Text(toggleText)
                        .font(.regular17)
                        .foregroundStyle(.ypBlackDual)
                    Toggle(isOn: $viewModel.isDarkSchemeOn) { }
                        .tint(.ypBlue)
                        .onChange(of: viewModel.isDarkSchemeOn, perform: { _ in
                            viewModel.changeColorScheme()
                        })
                }
                .frame(height: 60)
                
                NavigationLink {
                    AgreementView()
                } label: {
                    HStack {
                        Text(agreementText)
                            .font(.regular17)
                            .foregroundStyle(.ypBlackDual)
                        Spacer()
                        Image.chevronForward
                            .frame(width: 24, height: 24)
                            .foregroundStyle(.ypBlackDual)
                    }
                    .frame(height: 60)
                }
                
                Spacer()
                
                VStack(alignment: .center, spacing: 16) {
                    Text(viewModel.copyright_text)
                    Text(versionText)
                }
                .frame(height: 44)
                .font(.regular12)
                .foregroundStyle(.ypBlackDual)
                
            }
            .task {
                await viewModel.getCopyright()
            }
            .padding(.top, 24)
            .padding(.horizontal, 16)
            .padding(.bottom)
            
        case .error:
            ErrorView(errorType: viewModel.errorType)
        }
    }
}

#Preview {
    NavigationStack {
        SettingsScreenView()
    }
}
