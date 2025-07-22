//
//  CustomRoutine.swift
//  Loosen Up
//
//  Created by Geoffrey Belanger on 7/6/25.
//

import Foundation

struct CustomRoutine: Identifiable, Codable, Hashable {
    let id: UUID
    var name: String
    var stretches: [Stretch]
    
    // Computed properties for convenience
    var totalDurationInSeconds: Int {
        stretches.reduce(0) { $0 + $1.durationInSeconds + $1.restSeconds }
    }

    var stretchCount: Int {
        stretches.count
    }
    
    var isValid: Bool {
        !name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty && !stretches.isEmpty
    }
}
