//
//  Route.swift
//  Loosen Up
//
//  Created by Geoffrey Belanger on 7/24/25.
//

import Foundation

enum Route: Hashable {
    case mainMenu
    case preview(CustomRoutine)
    case timer(CustomRoutine)
    case builder
    case customBuilder(stretches: [Stretch])
}
