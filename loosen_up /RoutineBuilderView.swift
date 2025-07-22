//
//  RoutineBuilderView.swift
//  Loosen Up
//
//  Created by Geoffrey Belanger on 7/6/25.
//
import SwiftUI

struct RoutineBuilderView: View {
    @Binding var navigationPath: NavigationPath
    @State private var selectedStretches: Set<String> = []
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
                    navigationPath.removeLast(navigationPath.count)
                }
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)

                Spacer()

                Button("Next") {
                    navigationPath.append(selectedStretchObjects)
                }
                .disabled(selectedStretches.isEmpty)
                .padding()
                .background(selectedStretches.isEmpty ? Color.gray : Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
            .padding(.horizontal)
        }
        .navigationTitle("Build a Routine")
        .navigationDestination(for: [Stretch].self) { stretchList in
            CustomRoutineBuilderView(selectedStretches: stretchList)
                .environmentObject(routineManager)
        }
    }
}
