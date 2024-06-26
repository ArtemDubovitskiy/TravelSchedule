//
//  SettingsScreenView.swift
//  TravelSchedule
//
//  Created by Artem Dubovitsky on 23.05.2024.
//

import SwiftUI

struct SettingsScreenView: View {
    
    @Binding var isDarkScheme: Bool
    private let urlString = "https://yandex.ru/legal/practicum_offer/"
    
//    Тестовый URL для проверки темной темы WebView:
//    private let urlString = "https://developer.apple.com"
    
    // TODO: Добавить локализацию
    private let toggleText = "Темная тема"
    private let agreementText = "Пользовательское соглашение"
    private let apiText = "Приложение использует API «Яндекс.Расписания»"
    private let versionText = "Версия 1.0 (beta)"
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text(toggleText)
                    .font(.regular17)
                    .foregroundStyle(.ypBlackDual)
                Toggle(isOn: $isDarkScheme) { }
                    .tint(.ypBlue)
            }
            .frame(height: 60)
            
            NavigationLink {
                AgreementView(urlString: urlString)
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
                Text(apiText)
                Text(versionText)
            }
            .frame(height: 44)
            .font(.regular12)
            .foregroundStyle(.ypBlackDual)
            
        }
        .padding(.top, 24)
        .padding(.horizontal, 16)
        .padding(.bottom)
    }
}

#Preview {
    NavigationStack {
        SettingsScreenView(isDarkScheme: .constant(true))
    }
}
