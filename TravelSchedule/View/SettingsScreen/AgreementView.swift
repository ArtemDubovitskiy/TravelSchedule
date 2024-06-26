//
//  AgreementView.swift
//  TravelSchedule
//
//  Created by Artem Dubovitsky on 23.05.2024.
//

import SwiftUI

struct AgreementView: View {
    @EnvironmentObject var viewModel: ScheduleViewModel
    @Environment(\.dismiss) private var dismiss
    
    let urlString: String
    // TODO: Добавить локализацию
    private let agreementText = "Пользовательское соглашение"
    
    var body: some View {
        switch viewModel.state {
        case .loading:
            ProgressView()
        case .content:
            VStack {
                if let url = URL(string: urlString) {
                    WebView(url: url)
                        .navigationTitle(agreementText)
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
                }
            }
            .toolbar(.hidden, for: .tabBar)
        case .error:
            ErrorView(errorType: viewModel.errorType)
        }
    }
}

#Preview {
    AgreementView(urlString: "https://ya.ru").environmentObject(ScheduleViewModel(cities: []))
}
