//
//  RoutinePreviewView.swift
//  Loosen Up
//
//  Created by Geoffrey Belanger on 7/23/25.
//

import SwiftUI

struct RoutinePreviewView: View {
    let routine: CustomRoutine
    @EnvironmentObject var navigationCoordinator: NavigationCoordinator

    var totalDuration: Int {
        routine.totalDurationInSeconds
    }

    var body: some View {
        VStack(alignment: .leading) {
            Text(routine.name)
                .font(.largeTitle)
                .bold()
                .padding(.bottom, 5)

            Text("Total Time: \(totalDuration / 60):\(String(format: "%02d", totalDuration % 60))")
                .font(.subheadline)
                .foregroundColor(.gray)

            Text("Stretches")
                .font(.title2)
                .padding(.top)

            List(routine.stretches) { stretch in
                VStack(alignment: .leading) {
                    Text(stretch.name)
                        .font(.headline)
                    Text("Duration: \(stretch.durationInSeconds)s, Rest: \(stretch.restSeconds)s")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }

            Spacer()

            Text("🎵 You can start a music playlist now if you'd like.")
                .font(.footnote)
                .padding(.bottom, 10)

            Button("Start Routine") {
                navigationCoordinator.navigateTo(.timer(routine))
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .id(routine.id)
        .padding()
        .navigationTitle("Preview Routine")
    }
}

