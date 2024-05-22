//
//  MainSearchView.swift
//  TravelSchedule
//
//  Created by Artem Dubovitsky on 20.05.2024.
//

import SwiftUI

struct MainSearchView: View {
    @State private var departureStation = ""
    @State private var arrivalStation = ""
    
    private let radius: Double = 20
    private let bigRectangleHeight: Double = 128
    private let smallRectangleHeight: Double = 96
    private let textFieldHeight: Double = 48
    private let circleWidth: Double = 36

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: radius)
                .foregroundStyle(.ypBlue)
                .frame(height: bigRectangleHeight)
            HStack(spacing: 16) {
                RoundedRectangle(cornerRadius: radius)
                    .foregroundStyle(.ypWhite)
                    .frame(height: smallRectangleHeight)
                    .overlay(
                        VStack(spacing: 0) {
                            TextField("Откуда",
                                      text: $departureStation,
                                      prompt: Text("Откуда").foregroundColor(.ypGray)
                            )
                            .foregroundStyle(.ypBlack)
                            .frame(height: textFieldHeight)
                            TextField("Куда",
                                      text: $arrivalStation,
                                      prompt: Text("Куда").foregroundColor(.ypGray))
                            .foregroundStyle(.ypBlack)
                            .frame(height: textFieldHeight)
                        }
                            .padding(.leading, 10)
                    )
                ZStack {
                    Circle()
                        .foregroundStyle(.ypWhite)
                        .frame(width: circleWidth)
                    Button {
                        swap(&departureStation, &arrivalStation)
                    } label: {
                        Image.changeImage
                            .foregroundStyle(.ypBlue)
                    }
                }
            }
            .padding(16)
        }
        .padding(.horizontal, 16)
        
    }
}

#Preview {
    MainSearchView()
}
