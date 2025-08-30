//
//  CustomRoutineBuilderView.swift
//  Loosen Up
//
//  Created by Geoffrey Belanger on 7/6/25.
//
import SwiftUI

struct CustomRoutineBuilderView: View {
    @EnvironmentObject var navigationCoordinator: NavigationCoordinator
    @EnvironmentObject var routineManager: RoutineManager

    @State private var selectedStretches: [Stretch]
    @State private var routineName: String
    @State private var allStretches = StretchLibrary.allStretches

    init(selectedStretches: [Stretch]) {
        self._selectedStretches = State(initialValue: selectedStretches)
        self._routineName = State(initialValue: "")
    }

    var body: some View {
        VStack {
            Text("Build Your Own Routine")
                .font(.largeTitle)
                .padding(.bottom, 10)

            TextField("Name Your Routine", text: $routineName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)

            List {
                Section(header: Text("Selected Stretches (Drag to Reorder)")) {
                    ForEach(selectedStretches) { stretch in
                        Text(stretch.name)
                    }
                    .onMove(perform: moveStretch)
                    .onDelete(perform: removeStretch)
                }

                Section(header: Text("All Stretches")) {
                    ForEach(allStretches) { stretch in
                        Button {
                            // Prevent duplicate IDs—this line is the key fix!
                            if !selectedStretches.contains(where: { $0.id == stretch.id }) {
                                selectedStretches.append(stretch)
                            }
                        } label: {
                            HStack {
                                Text(stretch.name)
                                Spacer()
                                if selectedStretches.contains(where: { $0.id == stretch.id }) {
                                    Image(systemName: "checkmark")
                                        .foregroundColor(.blue)
                                }
                            }
                        }
                    }
                }
            }
            .environment(\.editMode, .constant(.active))

            Button(action: {
                let newRoutine = CustomRoutine(name: routineName, stretches: selectedStretches)
                routineManager.addRoutine(newRoutine)
                navigationCoordinator.navigateToMainMenu()
            }) {
                Text("Save Routine")
                    .bold()
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.horizontal)
            .disabled(routineName.isEmpty || selectedStretches.isEmpty)

            Spacer()
        }
        .navigationTitle("Custom Routine")
    }

    private func moveStretch(from source: IndexSet, to destination: Int) {
        selectedStretches.move(fromOffsets: source, toOffset: destination)
    }

    private func removeStretch(at offsets: IndexSet) {
        selectedStretches.remove(atOffsets: offsets)
    }
}

