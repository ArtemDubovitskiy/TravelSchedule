//
//  CarrierInfoScreenView.swift
//  TravelSchedule
//
//  Created by Artem Dubovitsky on 02.06.2024.
//

import SwiftUI

struct CarrierInfoScreenView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.openURL) private var openURL
    
    var carrier: Carrier
    
    // TODO: Добавить локализацию
    private let carrierInfoText = "Информация о перевозчике"
    private let eMailText = "E-mail"
    private let phoneText = "Телефон"
    
    var body: some View {
        VStack(spacing: 0) {
            AsyncImage(url: URL(string: carrier.logoSvg)) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 24))
                    .frame(maxWidth: .infinity, maxHeight: 110, alignment: .center)
                    .padding(.top, 16)
            } placeholder: { Image("StubIconFull") }
                .padding(.top, 16)
            
            Text("ОАО «\(carrier.title)»")
                .font(.bold24)
                .foregroundStyle(.ypBlackDual)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 16)
                .padding(.bottom, 16)
            
            VStack(alignment: .leading, spacing: 0) {
                Text(eMailText)
                    .font(.regular17)
                    .foregroundStyle(.ypBlackDual)
                    .frame(alignment: .leading)
                Text(carrier.email ?? "")
                    .font(.regular12)
                    .foregroundStyle(.ypBlue)
                    .onTapGesture {
                        guard let urlString = URL(string: "mailto:\(carrier.email ?? "")") else { return }
                        openURL(urlString)
                    }
            }
            .frame(maxWidth: .infinity, maxHeight: 60, alignment: .leading)
            
            VStack(alignment: .leading, spacing: 0) {
                Text(phoneText)
                    .font(.regular17)
                    .foregroundStyle(.ypBlackDual)
                    .frame(alignment: .leading)
                Text(carrier.phone ?? "")
                    .font(.regular12)
                    .foregroundStyle(.ypBlue)
                    .onTapGesture {
                        guard let urlString = URL(string: "tel:\(carrier.phone ?? "")") else { return }
                        openURL(urlString)
                    }
            }
            .frame(maxWidth: .infinity, maxHeight: 60, alignment: .leading)
            
            Spacer()
        }
        .padding(.horizontal, 16)
        .toolbar(.hidden, for: .tabBar)
        .navigationTitle(carrierInfoText)
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

#Preview {
    NavigationStack {
        CarrierInfoScreenView(
            carrier: MockData.mockCarrier[0]
        )
    }
}
