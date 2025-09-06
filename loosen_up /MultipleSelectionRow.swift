//
//  File.swift
//  Loosen Up
//
//  Created by Geoffrey Belanger on 7/7/25.
//
import SwiftUI

struct MultipleSelectionRow: View {
    let stretch: Stretch
    let isSelected: Bool
    let toggle: () -> Void

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
                Image(systemName: isSelected ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(isSelected ? .blue : .gray)
            }
            .padding(.vertical, 4)
        }
        .buttonStyle(.plain)
        .accessibilityLabel("\(stretch.name), \(stretch.bodyPart), \(isSelected ? "selected" : "not selected")")
    }
}

