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
    
    private let saveKey = "saved_custom_routines"
    private let userDefaults = UserDefaults.standard
    
    init() {
        loadRoutines()
    }
    
    // MARK: - Core Operations
    
    func addRoutine(_ routine: CustomRoutine) {
        // Prevent duplicates by name
        guard !savedRoutines.contains(where: { $0.name == routine.name }) else {
            print("Routine with name '\(routine.name)' already exists")
            return
        }
        
        savedRoutines.append(routine)
        saveRoutines()
    }
    
    func updateRoutine(_ routine: CustomRoutine) {
        if let index = savedRoutines.firstIndex(where: { $0.id == routine.id }) {
            savedRoutines[index] = routine
            saveRoutines()
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
    
    /*
    func routine(withId id: String) -> CustomRoutine? {
        return savedRoutines.first { $0.id == id }
    }
     */
    
    func routineExists(withName name: String) -> Bool {
        return savedRoutines.contains { $0.name == name }
    }
    
    var isEmpty: Bool {
        return savedRoutines.isEmpty
    }
    
    // MARK: - Persistence
    
    private func saveRoutines() {
        do {
            let encoded = try JSONEncoder().encode(savedRoutines)
            userDefaults.set(encoded, forKey: saveKey)
        } catch {
            print("Failed to save routines: \(error)")
            // In a production app, you might want to show user-facing error
        }
    }
    
    private func loadRoutines() {
        guard let data = userDefaults.data(forKey: saveKey) else {
            // No saved data - start with empty array
            return
        }
        
        do {
            let decoded = try JSONDecoder().decode([CustomRoutine].self, from: data)
            self.savedRoutines = decoded
        } catch {
            print("Failed to load routines: \(error)")
            // Reset to empty array on corruption
            self.savedRoutines = []
        }
    }
    
    // MARK: - Utility
    
    func clearAllRoutines() {
        savedRoutines.removeAll()
        saveRoutines()
    }
}
