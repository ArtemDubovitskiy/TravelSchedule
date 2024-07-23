//
//  SettingsViewModel.swift
//  TravelSchedule
//
//  Created by Artem Dubovitsky on 13.07.2024.
//
import SwiftUI

@MainActor
final class SettingsViewModel: ObservableObject, Sendable {
    @AppStorage("isDarkScheme") private var isDarkScheme: Bool = false
    @Published var isDarkSchemeOn: Bool = false
    @Published var copyrightText: String = ""
    @Published var state: AppState = .loading
    
    private let service = CopyrightService()
    private let mock_copyright_text = "Приложение использует API «Яндекс.Расписания»"
    
    init() {
        self.isDarkSchemeOn = isDarkScheme
    }
    // MARK: - Public Methods
    func changeColorScheme() {
        isDarkScheme = isDarkSchemeOn
    }
    
    func getCopyright() async {
        do {
            guard let text = try await service.copyright() else { return }
            self.copyrightText = text
            state = .content
        } catch {
            self.copyrightText = mock_copyright_text
            state = .error
        }
    }
}
