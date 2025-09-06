//
//  NavigationCoordinator.swift
//  Loosen Up
//
//  Created by Claude Code on 8/29/25.
//

import Foundation
import SwiftUI

@MainActor
class NavigationCoordinator: ObservableObject {
    @Published var path = NavigationPath()
    
    func navigateTo(_ route: Route) {
        path.append(route)
    }
    
    func navigateBack() {
        guard !path.isEmpty else { return }
        path.removeLast()
    }
    
    func navigateToRoot() {
        path.removeLast(path.count)
    }
    
    func navigateToMainMenu() {
        navigateToRoot()
        navigateTo(.mainMenu)
    }
    
    func popToMainMenu() {
        // Remove all routes except main menu
        while path.count > 1 {
            path.removeLast()
        }
    }
}