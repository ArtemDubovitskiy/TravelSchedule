//
//  ContentView.swift
//  TravelSchedule
//
//  Created by Artem Dubovitsky on 10.03.2024.
//

import SwiftUI

struct ContentView: View {
    // TODO: - привести в нормальный вид (далее в спринтах)
    // Не совсем красиво на мой взгляд кривовато использовать презентер, но не хотел здесь добавлять логику)
    private let presenter: ContentPresenterProtocol
    
    init(presenter: ContentPresenterProtocol) {
        self.presenter = presenter
    }
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            // Для запроса пожалуйста расскоментируйте нужную строку:
            presenter.schedule()
//            presenter.nearestStations()
//            presenter.nearestSettlement()
//            presenter.copyright()
//            presenter.carrier()
        }
    }
}

#Preview {
    ContentView(presenter: ContentPresenter())
}
