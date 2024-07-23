//
//  StoriesViewModel.swift
//  TravelSchedule
//
//  Created by Artem Dubovitsky on 14.07.2024.
//
import Foundation

@MainActor
final class StoriesViewModel: ObservableObject, @unchecked Sendable {
    @Published var state: AppState = .content
    @Published var errorType: ErrorType = .serverError
    @Published var stories: [Stories] = []
    @Published var selectedStory: Int = 0
    
    init() {
        getStories()
    }
    // MARK: - Private Methods
    private func getStories() {
        stories = MockData.mockStories
    }
}
