//
//  SavedRoutinesView.swift
//  Loosen Up
//
//  Created by Geoffrey Belanger on 7/6/25.
//
import SwiftUI

struct SavedRoutinesView: View {
    @Binding var navigationPath: NavigationPath
    @EnvironmentObject var routineManager: RoutineManager

    var body: some View {
        VStack {
            List {
                if routineManager.savedRoutines.isEmpty {
                    Text("No saved routines yet.")
                        .foregroundColor(.gray)
                } else {
                    ForEach(routineManager.savedRoutines) { routine in
                        NavigationLink(value: routine) {
                            VStack(alignment: .leading) {
                                Text(routine.name)
                                    .font(.headline)
                                Text("\(routine.stretches.count) stretches")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                    .onDelete { indexSet in
                        for index in indexSet {
                            let routine = routineManager.savedRoutines[index]
                            routineManager.deleteRoutine(routine)
                        }
                    }
                }
            }

            Button("Back to Main Menu") {
                navigationPath.removeLast(navigationPath.count)
            }
            .padding()
            .background(Color.gray.opacity(0.2))
            .cornerRadius(10)
        }
        .navigationTitle("Saved Routines")
        .navigationDestination(for: CustomRoutine.self) { routine in
            StretchTimerView(routine: routine, navigationPath: $navigationPath)
                .environmentObject(routineManager) // ✅ This line fixes the crash
        }
    }
}
