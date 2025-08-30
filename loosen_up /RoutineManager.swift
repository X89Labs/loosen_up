//
//  RoutineManager.swift
//  Loosen Up
//
//  Created by Geoffrey Belanger on 7/6/25.
//

import Foundation

@MainActor
class RoutineManager: ObservableObject {
    @Published var savedRoutines: [CustomRoutine] = []
    @Published var errorMessage: String?

    private let saveKey = "saved_custom_routines"
    private let userDefaults = UserDefaults.standard

    init() {
        loadRoutines()

        // Inject built-in routines only once, if nothing is saved yet
        if savedRoutines.isEmpty {
            savedRoutines = builtInRoutines
            saveRoutines()
        }
    }
    // MARK: - Core Operations

    func addRoutine(_ routine: CustomRoutine) {
        guard routine.isValid else {
            errorMessage = "Cannot save invalid routine"
            return
        }
        
        guard !savedRoutines.contains(where: { $0.name == routine.name }) else {
            errorMessage = "A routine with the name '\(routine.name)' already exists"
            return
        }

        savedRoutines.append(routine)
        if !saveRoutines() {
            savedRoutines.removeLast() // Rollback on failure
        }
    }

    func updateRoutine(_ routine: CustomRoutine) {
        guard routine.isValid else {
            errorMessage = "Cannot update with invalid routine data"
            return
        }
        
        if let index = savedRoutines.firstIndex(where: { $0.id == routine.id }) {
            let originalRoutine = savedRoutines[index]
            savedRoutines[index] = routine
            if !saveRoutines() {
                savedRoutines[index] = originalRoutine // Rollback on failure
            }
        }
    }

    func deleteRoutine(_ routine: CustomRoutine) {
        savedRoutines.removeAll { $0.id == routine.id }
        saveRoutines()
    }

    func deleteRoutine(at index: Int) {
        guard index >= 0 && index < savedRoutines.count else { return }
        savedRoutines.remove(at: index)
        saveRoutines()
    }

    func deleteRoutines(at offsets: IndexSet) {
        savedRoutines.remove(atOffsets: offsets)
        saveRoutines()
    }

    // MARK: - Queries

    func routineExists(withName name: String) -> Bool {
        return savedRoutines.contains { $0.name == name }
    }

    var isEmpty: Bool {
        return savedRoutines.isEmpty
    }

    // MARK: - Persistence

    @discardableResult
    private func saveRoutines() -> Bool {
        do {
            let encoded = try JSONEncoder().encode(savedRoutines)
            userDefaults.set(encoded, forKey: saveKey)
            errorMessage = nil
            return true
        } catch {
            errorMessage = "Failed to save routines: \(error.localizedDescription)"
            return false
        }
    }

    private func loadRoutines() {
        guard let data = userDefaults.data(forKey: saveKey) else {
            return
        }

        do {
            let decoded = try JSONDecoder().decode([CustomRoutine].self, from: data)
            // Validate loaded routines
            self.savedRoutines = decoded.filter { $0.isValid }
            errorMessage = nil
        } catch {
            errorMessage = "Failed to load saved routines: \(error.localizedDescription)"
            self.savedRoutines = []
        }
    }

    // MARK: - Utility

    func clearAllRoutines() {
        savedRoutines.removeAll()
        userDefaults.removeObject(forKey: saveKey)
        errorMessage = nil
    }
    
    func clearError() {
        errorMessage = nil
    }
}

let builtInRoutines: [CustomRoutine] = [
    CustomRoutine(
        name: "Full Body Starter",
        stretches: [
            StretchLibrary.named("Neck Roll"),
            StretchLibrary.named("Shoulder Roll"),
            StretchLibrary.named("Torso Twist"),
            StretchLibrary.named("Quad Stretch"),
            StretchLibrary.named("Hamstring Stretch")
        ]
    ),
    CustomRoutine(
        name: "Morning Wake-Up",
        stretches: [
            StretchLibrary.named("Chest Opener"),
            StretchLibrary.named("Standing Side Reach"),
            StretchLibrary.named("Forward Fold"),
            StretchLibrary.named("Calf Stretch"),
            StretchLibrary.named("Neck Tilt")
        ]
    ),
    CustomRoutine(
        name: "Evening Cool-Down",
        stretches: [
            StretchLibrary.named("Child's Pose"),
            StretchLibrary.named("Seated Forward Fold"),
            StretchLibrary.named("Cat-Cow Stretch"),
            StretchLibrary.named("Lying Spinal Twist"),
            StretchLibrary.named("Butterfly Stretch")
        ]
    ),
    CustomRoutine(
        name: "Back Relief",
        stretches: [
            StretchLibrary.named("Knee to Chest"),
            StretchLibrary.named("Pelvic Tilt"),
            StretchLibrary.named("Thread the Needle"),
            StretchLibrary.named("Standing Forward Fold"),
            StretchLibrary.named("Cat-Cow Stretch")
        ]
    ),
    CustomRoutine(
        name: "Hips & Hammies",
        stretches: [
            StretchLibrary.named("Lunge Stretch"),
            StretchLibrary.named("Seated Hamstring Stretch"),
            StretchLibrary.named("Figure Four Stretch"),
            StretchLibrary.named("Butterfly Stretch"),
            StretchLibrary.named("Pigeon Pose")
        ]
    )
]
