//
//  TimerConfiguration.swift
//  TravelSchedule
//
//  Created by Artem Dubovitsky on 29.06.2024.
//
import Foundation

struct TimerConfiguration {
    let storiesCount: Int
    let timerTickInterval: TimeInterval
    let progressPerTick: CGFloat
    
    init(
        storiesCount: Int,
        secondsPerStory: TimeInterval = 5,
        timerTickInterval: TimeInterval = 0.25
    ) {
        self.storiesCount = storiesCount
        self.timerTickInterval = timerTickInterval
        self.progressPerTick = 1.0 / CGFloat(storiesCount) / secondsPerStory * timerTickInterval
    }
}
