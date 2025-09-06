//  Loosen_UpApp.swift
//  Loosen Up
//
//  Created by Geoffrey Belanger on 7/5/25.
//
import SwiftUI
@main
struct LoosenUpApp: App {
    @StateObject private var routineManager = RoutineManager()
    @StateObject private var navigationCoordinator = NavigationCoordinator()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $navigationCoordinator.path) {
                WelcomeView()
                    .navigationDestination(for: Route.self) { route in
                        switch route {
                        case .mainMenu:
                            MainMenuView()
                                .environmentObject(routineManager)
                        case .preview(let routine):
                            RoutinePreviewView(routine: routine)
                                .environmentObject(routineManager)
                        case .timer(let routine):
                            StretchTimerView(routine: routine)
                                .environmentObject(routineManager)
                        case .builder:
                            RoutineBuilderView()
                                .environmentObject(routineManager)
                        case .customBuilder(let stretches):
                            CustomRoutineBuilderView(selectedStretches: stretches)
                                .environmentObject(routineManager)
                        }
                    }
            }
            .environmentObject(routineManager)
            .environmentObject(navigationCoordinator)
        }
    }
}






