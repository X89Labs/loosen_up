//
//  StretchTimerViewModel.swift
//  Loosen Up
//
//  Created by Claude Code on 8/29/25.
//

import Foundation
import Combine
import AVFoundation

@MainActor
class StretchTimerViewModel: ObservableObject {
    @Published var currentIndex = 0
    @Published var timeRemaining = 10
    @Published var isResting = false
    @Published var timerActive = false
    @Published var showComplete = false
    @Published var prepPhaseDone = false
    @Published var isFirstStretch = true
    @Published var isPaused = false
    
    private let routine: CustomRoutine
    private let prepTime = 10
    private var timer: AnyCancellable?
    private var audioPlayer: AVAudioPlayer?
    
    var currentStretch: Stretch {
        routine.stretches[currentIndex]
    }
    
    var totalStretches: Int {
        routine.stretches.count
    }
    
    var phaseTitle: String {
        if !prepPhaseDone {
            return isFirstStretch ? "Get Ready: \(currentStretch.name)" : "Rest"
        } else {
            return currentStretch.name
        }
    }
    
    var timeFormatted: String {
        let minutes = timeRemaining / 60
        let seconds = timeRemaining % 60
        return String(format: "%01d:%02d", minutes, seconds)
    }
    
    init(routine: CustomRoutine) {
        self.routine = routine
    }
    
    func startTimer() {
        timeRemaining = prepTime
        timerActive = true
        isFirstStretch = true
        
        timer = Timer.publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                self?.timerTick()
            }
    }
    
    func pauseTimer() {
        isPaused.toggle()
    }
    
    func stopTimer() {
        timer?.cancel()
        timer = nil
        timerActive = false
    }
    
    private func timerTick() {
        guard timerActive && !isPaused else { return }
        
        if timeRemaining > 0 {
            timeRemaining -= 1
            playTone(for: timeRemaining)
        } else {
            advancePhase()
        }
    }
    
    private func advancePhase() {
        if isFirstStretch {
            // First stretch only: start from prep
            prepPhaseDone = true
            isFirstStretch = false
            timeRemaining = currentStretch.durationInSeconds
            return
        }

        if !prepPhaseDone {
            // Begin stretch phase (after rest)
            prepPhaseDone = true
            timeRemaining = currentStretch.durationInSeconds
            return
        }

        if isResting {
            // End of rest → prep/stretch for next
            currentIndex += 1
            if currentIndex >= totalStretches {
                timerActive = false
                showComplete = true
                stopTimer()
            } else {
                isResting = false
                prepPhaseDone = false
                timeRemaining = currentStretch.durationInSeconds
            }
        } else {
            // End of stretch → rest period
            isResting = true
            prepPhaseDone = false
            timeRemaining = prepTime
        }
    }
    
    private func playTone(for secondsLeft: Int) {
        guard secondsLeft == 2,
              let url = Bundle.main.url(forResource: "tone_sequence", withExtension: "wav") else { return }

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.prepareToPlay()
            audioPlayer?.play()
        } catch {
            print("Failed to play tone sequence: \(error)")
        }
    }
    
    deinit {
        stopTimer()
    }
}