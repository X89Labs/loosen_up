//  Loosen_UpApp.swift
//  Loosen Up
//
//  Created by Geoffrey Belanger on 7/5/25.
//
import SwiftUI
@main
struct LoosenUpApp: App {
    @State private var path = NavigationPath()
    @StateObject private var routineManager = RoutineManager()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $path) {
                WelcomeView(navigationPath: $path)
                    .navigationDestination(for: Route.self) { route in
                        switch route {
                        case .mainMenu:
                            MainMenuView(navigationPath: $path)
                                .environmentObject(routineManager)
                        case .preview(let routine):
                            RoutinePreviewView(routine: routine, navigationPath: $path)
                                .environmentObject(routineManager)
                        case .timer(let routine):
                            StretchTimerView(routine: routine, navigationPath: $path)
                                .environmentObject(routineManager)
                        case .builder:
                            RoutineBuilderView(navigationPath: $path)
                                .environmentObject(routineManager)
                        case .customBuilder(let stretches):  // <-- ADD THIS BLOCK
                            CustomRoutineBuilderView(navigationPath: $path, selectedStretches: stretches)
                                .environmentObject(routineManager)
                        }
                    }
            }
            .environmentObject(routineManager)
        }
    }
}






