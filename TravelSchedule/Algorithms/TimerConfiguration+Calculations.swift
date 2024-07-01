//
//  TimerConfiguration+Calculations.swift
//  TravelSchedule
//
//  Created by Artem Dubovitsky on 29.06.2024.
//
import Foundation

extension TimerConfiguration {
    func progress(for storyIndex: Int) -> CGFloat {
        min(CGFloat(storyIndex) / CGFloat(storiesCount), 1)
    }
    
    func index(for progress: CGFloat) -> Int {
        min(Int(progress * CGFloat(storiesCount)), storiesCount - 1)
    }
    
    func nextProgress(progress: CGFloat) -> CGFloat {
        min(progress + progressPerTick, 1)
    }
}
