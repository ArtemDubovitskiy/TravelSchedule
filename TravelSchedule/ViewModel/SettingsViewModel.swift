//
//  SettingsViewModel.swift
//  TravelSchedule
//
//  Created by Artem Dubovitsky on 13.07.2024.
//
import SwiftUI

final class SettingsViewModel: ObservableObject {
    @AppStorage("isDarkScheme") private var isDarkScheme: Bool = false
    @Published var isDarkSchemeOn: Bool = false
    
    init() {
        self.isDarkSchemeOn = isDarkScheme
    }
    // MARK: - Public Methods
    func changeColorScheme() {
        isDarkScheme = isDarkSchemeOn
    }
}
