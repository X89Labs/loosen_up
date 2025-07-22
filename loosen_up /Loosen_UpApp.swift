//
//  Loosen_UpApp.swift
//  Loosen Up
//
//  Created by Geoffrey Belanger on 7/5/25.
//
import SwiftUI

@main
struct LoosenUpApp: App {
    @StateObject private var routineManager = RoutineManager()
    @State private var navigationPath = NavigationPath()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $navigationPath) {
                WelcomeView(navigationPath: $navigationPath)
                    .environmentObject(routineManager)
                    .navigationDestination(for: String.self) { route in
                        switch route {
                        case "main":
                            MainMenuView(navigationPath: $navigationPath)
                                .environmentObject(routineManager)
                        case "builder":
                            RoutineBuilderView(navigationPath: $navigationPath)
                                .environmentObject(routineManager)
                        case "saved":
                            SavedRoutinesView(navigationPath: $navigationPath)
                                .environmentObject(routineManager)
                        default:
                            EmptyView()
                        }
                    }
            }
        }
    }
}

