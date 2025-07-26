//
//  File.swift
//  Loosen Up
//
//  Created by Geoffrey Belanger on 7/8/25.
//

import Foundation

struct Stretch: Identifiable, Codable, Hashable {
    let id: UUID
    let name: String
    let bodyPart: String
    let durationInSeconds: Int
    let restSeconds: Int
    let videoName: String

    init(
        id: UUID = UUID(),
        name: String,
        bodyPart: String,
        durationInSeconds: Int,
        restSeconds: Int,
        videoName: String
    ) {
        self.id = id
        self.name = name
        self.bodyPart = bodyPart
        self.durationInSeconds = durationInSeconds
        self.restSeconds = restSeconds
        self.videoName = videoName
    }
    
    // Computed property for total time (stretch + rest)
    var totalTime: Int {
        durationInSeconds + restSeconds
    }
    
    // Validation
    var isValid: Bool {
        !name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty &&
        !bodyPart.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty &&
        durationInSeconds > 0 &&
        restSeconds >= 0 &&
        !videoName.isEmpty
    }
}
