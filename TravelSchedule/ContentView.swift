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
        .task {
            // Для запроса пожалуйста расскоментируйте нужную строку:
            presenter.search() // Расписание рейсов между станциями
//            presenter.schedule() // Расписание рейсов по станции
//            presenter.threads() // Список станций следования
//            presenter.nearestStations() // Список ближайших станций
//            presenter.nearestSettlement() // Ближайший город
//            presenter.carrier() // Информация о перевозчике
//            presenter.stationsList() // Список всех доступных станций
//            presenter.copyright() // Копирайт Яндекс Расписаний
        }
    }
}

#Preview {
    ContentView(presenter: ContentPresenter())
}
