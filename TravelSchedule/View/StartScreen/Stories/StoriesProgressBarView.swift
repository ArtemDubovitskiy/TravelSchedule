//
//  StoriesProgressBarView.swift
//  TravelSchedule
//
//  Created by Artem Dubovitsky on 29.06.2024.
//
import SwiftUI
import Combine

struct StoriesProgressBarView: View {
    
    let storiesCount: Int
    let timerConfiguration: TimerConfiguration
    
    @Binding var currentProgress: CGFloat
    @State private var timer: Timer.TimerPublisher
    @State private var cancellable: Cancellable?
    
    init(
        storiesCount: Int,
        timerConfiguration: TimerConfiguration,
        currentProgress: Binding<CGFloat>
    ) {
        self.storiesCount = storiesCount
        self.timerConfiguration = timerConfiguration
        self._currentProgress = currentProgress
        self._timer = State(
            initialValue: Self.createTimer(configuration: timerConfiguration)
        )
    }
    
    var body: some View {
        ProgressBarView(
            numberOfSections: storiesCount,
            progress: currentProgress
        )
        .padding(.init(
            top: 35,
            leading: 12,
            bottom: 12,
            trailing: 12
        ))
        .onAppear {
            timer = Self.createTimer(configuration: timerConfiguration)
            cancellable = timer.connect()
        }
        .onDisappear {
            cancellable?.cancel()
        }
        .onReceive(timer) { _ in
            timerTick()
        }
    }
    // MARK: - Private Methods
    private func timerTick() {
        var nextProgress = currentProgress + timerConfiguration.progressPerTick
        if nextProgress >= 1 {
            nextProgress = 0
        }
        withAnimation {
            currentProgress = nextProgress
        }
    }
}

extension StoriesProgressBarView {
    private static func createTimer(configuration: TimerConfiguration
    ) -> Timer.TimerPublisher {
        Timer.publish(
            every: configuration.timerTickInterval,
            on: .main,
            in: .common
        )
    }
}
