//
//  CustomRoutineBuilderView.swift
//  Loosen Up
//
//  Created by Geoffrey Belanger on 7/6/25.
//
import SwiftUI

struct CustomRoutineBuilderView: View {
    @State private var selectedStretches: [Stretch]
    @State private var routineName: String
    @State private var allStretches = StretchLibrary.allStretches
    @State private var showingSaveAlert = false

    init(selectedStretches: [Stretch]) {
        _selectedStretches = State(initialValue: selectedStretches)
        _routineName = State(initialValue: "")
    }


    var body: some View {
        NavigationStack {
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
                                if !selectedStretches.contains(stretch) {
                                    selectedStretches.append(stretch)
                                }
                            } label: {
                                HStack {
                                    Text(stretch.name)
                                    Spacer()
                                    if selectedStretches.contains(stretch) {
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
                    showingSaveAlert = true
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
                .alert("Routine Saved!", isPresented: $showingSaveAlert) {
                    Button("OK", role: .cancel) { }
                } message: {
                    Text("Your custom routine \"\(routineName)\" has been saved.")
                }

                Spacer()
            }
            .navigationTitle("Custom Routine")
        }
    }

    private func moveStretch(from source: IndexSet, to destination: Int) {
        selectedStretches.move(fromOffsets: source, toOffset: destination)
    }

    private func removeStretch(at offsets: IndexSet) {
        selectedStretches.remove(atOffsets: offsets)
    }
}
