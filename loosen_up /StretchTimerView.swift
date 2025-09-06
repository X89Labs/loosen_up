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
    @EnvironmentObject var navigationCoordinator: NavigationCoordinator
    @StateObject private var viewModel: StretchTimerViewModel
    @State private var videoPlayer = AVPlayer()
    @State private var videoObserver: NSObjectProtocol?
    
    init(routine: CustomRoutine) {
        self.routine = routine
        self._viewModel = StateObject(wrappedValue: StretchTimerViewModel(routine: routine))
    }

    public var body: some View {
        VStack(spacing: 20) {
            Text(routine.name)
                .font(.title)
                .padding(.top)

            Text(viewModel.phaseTitle)
                .font(.headline)

            Text(viewModel.timeFormatted)
                .font(.system(size: 60))
                .monospacedDigit()
                .padding()

            VideoPlayer(player: videoPlayer)
                .frame(height: 200)
                .cornerRadius(12)

            Button(viewModel.isPaused ? "Resume" : "Pause") {
                viewModel.pauseTimer()
            }
            .padding()
            .background(Color.orange)
            .foregroundColor(.white)
            .cornerRadius(10)

            Spacer()
        }
        .padding()
        .onAppear {
            viewModel.startTimer()
            playVideo(for: viewModel.currentStretch)
        }
        .onChange(of: viewModel.currentIndex) { _ in
            playVideo(for: viewModel.currentStretch)
        }
        .fullScreenCover(isPresented: $viewModel.showComplete) {
            VStack(spacing: 20) {
                Text("Routine Complete!")
                    .font(.largeTitle)
                    .padding()

                Button("Back to Main Menu") {
                    navigationCoordinator.navigateToMainMenu()
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
        }
        .onDisappear {
            cleanupVideoObserver()
        }
    }


    private func playVideo(for stretch: Stretch) {
        cleanupVideoObserver()
        
        // Validate video resource exists
        guard !stretch.videoName.isEmpty,
              let url = Bundle.main.url(forResource: stretch.videoName, withExtension: nil) else {
            // Fallback: clear video player and continue without video
            videoPlayer.replaceCurrentItem(with: nil)
            print("Warning: Video file '\(stretch.videoName)' not found in bundle")
            return
        }

        let item = AVPlayerItem(url: url)

        // Loop when finished - store observer for cleanup
        videoObserver = NotificationCenter.default.addObserver(
            forName: .AVPlayerItemDidPlayToEndTime,
            object: item,
            queue: .main
        ) { _ in
            videoPlayer.seek(to: .zero)
            videoPlayer.play()
        }

        videoPlayer.replaceCurrentItem(with: item)
        videoPlayer.play()
    }
    
    private func cleanupVideoObserver() {
        if let observer = videoObserver {
            NotificationCenter.default.removeObserver(observer)
            videoObserver = nil
        }
    }
}
