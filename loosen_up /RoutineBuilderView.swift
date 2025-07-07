//
//  RoutineBuilderView.swift
//  Loosen Up
//
//  Created by Geoffrey Belanger on 7/6/25.
//

import SwiftUI

struct RoutineBuilderView: View {
    @State private var selectedStretches: Set<UUID> = []
    @State private var selectedStretchesToNavigate: [Stretch]? = nil
    
    private var selectedStretchObjects: [Stretch] {
        StretchLibrary.allStretches.filter { selectedStretches.contains($0.id) }
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(StretchLibrary.allStretches) { stretch in
                        MultipleSelectionRow(stretch: stretch, isSelected: selectedStretches.contains(stretch.id)) {
                            if selectedStretches.contains(stretch.id) {
                                selectedStretches.remove(stretch.id)
                            } else {
                                selectedStretches.insert(stretch.id)
                            }
                        }
                    }
                }
                
                NavigationLink(value: selectedStretchObjects) {
                    EmptyView()
                }
                .hidden()
                
                Button("Next") {
                    selectedStretchesToNavigate = selectedStretchObjects
                }
                .disabled(selectedStretches.isEmpty)
                .padding()
                .background(selectedStretches.isEmpty ? Color.gray : Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
            .navigationTitle("Build a Routine")
            .navigationDestination(for: [Stretch].self) { stretchList in
                CustomRoutineBuilderView(selectedStretches: stretchList)
            }
        }
    }
    
    struct MultipleSelectionRow: View {
        let stretch: Stretch
        var isSelected: Bool
        var toggle: () -> Void
        
        var body: some View {
            Button(action: toggle) {
                HStack {
                    VStack(alignment: .leading) {
                        Text(stretch.name)
                            .font(.headline)
                        Text(stretch.bodyPart)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    if isSelected {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(.blue)
                    } else {
                        Image(systemName: "circle")
                            .foregroundColor(.gray)
                    }
                }
            }
        }
    }
}
