//
//  StoriesViewModel.swift
//  TravelSchedule
//
//  Created by Artem Dubovitsky on 14.07.2024.
//
import Foundation

@MainActor
final class StoriesViewModel: ObservableObject, Sendable {
    // MARK: - Public Properties
    @Published var state: AppState = .content
    @Published var errorType: ErrorType = .serverError
    @Published var stories: [Stories] = []
    @Published var selectedStory: Int = 0
    
    // MARK: - Init
    init() {
        getStories()
    }
    // MARK: - Private Methods
    private func getStories() {
        stories = MockData.mockStories
    }
}
