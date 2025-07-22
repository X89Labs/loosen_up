//
//  StretchTimerView.swift
//  Loosen Up
//
//  Created by Geoffrey Belanger on 7/6/25.
//

import SwiftUI
import AVKit
import Combine

public struct StretchTimerView: View {
    let routine: CustomRoutine
    @Binding var navigationPath: NavigationPath

    @State private var currentIndex = 0
    @State private var timeRemaining = 10
    @State private var isResting = false
    @State private var timerActive = false
    @State private var showComplete = false
    @State private var prepPhaseDone = false
    @State private var audioPlayer: AVAudioPlayer?
    @State private var videoPlayer = AVPlayer()
    @State private var isPaused = false

    private let prepTime = 10
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    private var currentStretch: Stretch {
        routine.stretches[currentIndex]
    }

    private var totalStretches: Int {
        routine.stretches.count
    }

    public var body: some View {
        VStack(spacing: 20) {
            Text(routine.name)
                .font(.title)
                .padding(.top)

            Text(phaseTitle)
                .font(.headline)

            Text(timeFormatted)
                .font(.system(size: 60))
                .monospacedDigit()
                .padding()

            VideoPlayer(player: videoPlayer)
                .frame(height: 200)
                .cornerRadius(12)
                .onAppear {
                    if let url = Bundle.main.url(forResource: currentStretch.videoName, withExtension: nil) {
                        videoPlayer.replaceCurrentItem(with: AVPlayerItem(url: url))
                        videoPlayer.play()
                    }
                }

            Button(isPaused ? "Resume" : "Pause") {
                isPaused.toggle()
            }
            .padding()
            .background(Color.orange)
            .foregroundColor(.white)
            .cornerRadius(10)

            Spacer()
        }
        .padding()
        .onAppear {
            timeRemaining = prepTime
            timerActive = true
        }
        .onReceive(timer) { _ in
            guard timerActive && !isPaused else { return }

            if timeRemaining > 0 {
                timeRemaining -= 1
                playTone(for: timeRemaining)
            } else {
                advancePhase()
            }
        }
        .fullScreenCover(isPresented: $showComplete) {
            VStack(spacing: 20) {
                Text("Routine Complete!")
                    .font(.largeTitle)
                    .padding()

                Button("Back to Main Menu") {
                    navigationPath.removeLast(navigationPath.count)
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
        }
    }

    private var phaseTitle: String {
        if !prepPhaseDone {
            return "Get Ready: \(currentStretch.name)"
        } else {
            return isResting ? "Rest" : currentStretch.name
        }
    }

    private var timeFormatted: String {
        let minutes = timeRemaining / 60
        let seconds = timeRemaining % 60
        return String(format: "%01d:%02d", minutes, seconds)
    }

    private func advancePhase() {
        if !prepPhaseDone {
            prepPhaseDone = true
            timeRemaining = currentStretch.durationInSeconds
            playVideo(for: currentStretch)
            return
        }

        if isResting {
            currentIndex += 1
            if currentIndex >= totalStretches {
                timerActive = false
                showComplete = true
            } else {
                isResting = false
                timeRemaining = routine.stretches[currentIndex].durationInSeconds
                playVideo(for: routine.stretches[currentIndex])
            }
        } else {
            isResting = true
            timeRemaining = currentStretch.restSeconds
            videoPlayer.replaceCurrentItem(with: nil)
        }
    }

    private func playTone(for secondsLeft: Int) {
        let toneName: String?

        switch secondsLeft {
        case 2:
            toneName = "tone_short"
        case 1:
            toneName = "tone_short"
        case 0:
            toneName = "tone_long"
        default:
            toneName = nil
        }

        guard let name = toneName,
              let url = Bundle.main.url(forResource: name, withExtension: "mp3") else { return }

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.prepareToPlay()
            audioPlayer?.play()
        } catch {
            print("Failed to play tone: \(error)")
        }
    }

    private func playVideo(for stretch: Stretch) {
        guard let url = Bundle.main.url(forResource: stretch.videoName, withExtension: nil) else {
            videoPlayer.replaceCurrentItem(with: nil)
            return
        }

        videoPlayer.replaceCurrentItem(with: AVPlayerItem(url: url))
        videoPlayer.play()
    }
}
