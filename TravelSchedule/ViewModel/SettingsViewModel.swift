//
//  SettingsViewModel.swift
//  TravelSchedule
//
//  Created by Artem Dubovitsky on 13.07.2024.
//
import SwiftUI

@MainActor
final class SettingsViewModel: ObservableObject {
    @AppStorage("isDarkScheme") private var isDarkScheme: Bool = false
    @Published var isDarkSchemeOn: Bool = false
    @Published var copyright_text: String = "Приложение использует API «Яндекс.Расписания»"
    @Published var state: AppState = .content
    @Published var errorType: ErrorType = .serverError
    
    private let service = CopyrightService()
    
    init() {
        self.isDarkSchemeOn = isDarkScheme
    }
    // MARK: - Public Methods
    func changeColorScheme() {
        isDarkScheme = isDarkSchemeOn
    }
    
    func getCopyright() async {
        state = .loading
        Task {
            do {
                let text = try await service.copyright()
                self.copyright_text = text
                state = .content
            } catch {
                print("не загружен копирайт")
    //            errorType = .serverError
    //            state = .error
            }
        }
    }
}
