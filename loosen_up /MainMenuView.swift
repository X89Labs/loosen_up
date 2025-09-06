//  MainMenuView.swift
//  Loosen Up
//
//  Created by Geoffrey Belanger on 7/6/25.
//

import SwiftUI

struct MainMenuView: View {
    @EnvironmentObject var navigationCoordinator: NavigationCoordinator
    @EnvironmentObject var routineManager: RoutineManager
    @Environment(\.editMode) private var editMode
    @State private var showError = false

    var body: some View {
        VStack {
            Text("Your Saved Routines")
                .font(.title2)
                .padding(.top)

            if routineManager.savedRoutines.isEmpty {
                Text("No routines saved yet.")
                    .foregroundColor(.gray)
                    .padding()
            } else {
                List {
                    ForEach(routineManager.savedRoutines) { routine in
                        Button(action: {
                            navigationCoordinator.navigateTo(.preview(routine))
                        }) {
                            VStack(alignment: .leading) {
                                Text(routine.name)
                                    .font(.headline)
                                Text("\(routine.stretches.count) stretches")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                    .onDelete(perform: routineManager.deleteRoutines)
                }
                .listStyle(.inset)
                .environment(\.editMode, editMode)
            }

            Spacer()

            Button("➕ Create New Routine") {
                navigationCoordinator.navigateTo(.builder)
            }
            .font(.title3)
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(12)
            .padding(.horizontal)
            .padding(.bottom, 20)
        }
        .navigationTitle("Loosen Up")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                EditButton()
            }
        }
        .alert("Error", isPresented: $showError) {
            Button("OK") {
                routineManager.clearError()
            }
        } message: {
            Text(routineManager.errorMessage ?? "An unknown error occurred")
        }
        .onChange(of: routineManager.errorMessage) { errorMessage in
            showError = errorMessage != nil
        }
    }
}

