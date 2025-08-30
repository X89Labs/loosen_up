//
//  RoutineBuilderView.swift
//  Loosen Up
//
//  Created by Geoffrey Belanger on 7/6/25.
//

import SwiftUI

struct StretchListWrapper: Hashable {
    let stretches: [Stretch]
}

struct RoutineBuilderView: View {
    @EnvironmentObject var navigationCoordinator: NavigationCoordinator
    @State private var selectedStretches: Set<UUID> = []
    @EnvironmentObject var routineManager: RoutineManager

    private var selectedStretchObjects: [Stretch] {
        StretchLibrary.allStretches.filter { selectedStretches.contains($0.id) }
    }

    var body: some View {
        VStack {
            List {
                ForEach(StretchLibrary.allStretches) { stretch in
                    MultipleSelectionRow(
                        stretch: stretch,
                        isSelected: selectedStretches.contains(stretch.id)
                    ) {
                        if selectedStretches.contains(stretch.id) {
                            selectedStretches.remove(stretch.id)
                        } else {
                            selectedStretches.insert(stretch.id)
                        }
                    }
                }
            }

            Text("Selected: \(selectedStretches.count)")
                .font(.subheadline)
                .padding(.top, 4)

            HStack {
                Button("Back to Main Menu") {
                    navigationCoordinator.navigateToMainMenu()
                }
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)

                Spacer()

                Button("Next") {
                    let expanded = expandedStretches(from: selectedStretchObjects)
                    navigationCoordinator.navigateTo(.customBuilder(stretches: expanded))
                }
                .disabled(selectedStretches.isEmpty)
                .padding()
                .background(selectedStretches.isEmpty ? Color.gray : Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
            .padding(.horizontal)
        }
    }

    private func expandedStretches(from stretches: [Stretch]) -> [Stretch] {
        var result: [Stretch] = []
        for stretch in stretches {
            if stretch.isBilateral {
                result.append(
                    Stretch(
                        name: "\(stretch.name) (Right)",
                        bodyPart: stretch.bodyPart,
                        durationInSeconds: stretch.durationInSeconds,
                        restSeconds: stretch.restSeconds,
                        videoName: stretch.videoName,
                        isBilateral: false
                    )
                )
                result.append(
                    Stretch(
                        name: "\(stretch.name) (Left)",
                        bodyPart: stretch.bodyPart,
                        durationInSeconds: stretch.durationInSeconds,
                        restSeconds: stretch.restSeconds,
                        videoName: stretch.videoName,
                        isBilateral: false
                    )
                )
            } else {
                result.append(stretch)
            }
        }
        return result
    }
}
