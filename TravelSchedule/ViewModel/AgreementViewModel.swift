//
//  AgreementViewModel.swift
//  TravelSchedule
//
//  Created by Artem Dubovitsky on 13.07.2024.
//
import Foundation

@MainActor
final class AgreementViewModel: ObservableObject, Sendable {
    // MARK: - Public Properties
    @Published var state: AppState = .content
    @Published var errorType: ErrorType = .serverError
    @Published var usrString: String = ""
    
    // MARK: - Init
    init() {
        self.usrString = Constants.urlString
    }
}
