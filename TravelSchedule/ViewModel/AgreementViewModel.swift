//
//  AgreementViewModel.swift
//  TravelSchedule
//
//  Created by Artem Dubovitsky on 13.07.2024.
//
import Foundation

@MainActor
final class AgreementViewModel: ObservableObject, @unchecked Sendable {
    @Published var state: AppState = .content
    @Published var errorType: ErrorType = .serverError
    @Published var usrString: String = ""
    
    init() {
        self.usrString = Constants.urlString
    }
}
