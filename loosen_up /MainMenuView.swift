//
//  MainMenuView.swift
//  Loosen Up
//
//  Created by Geoffrey Belanger on 7/6/25.
//
import SwiftUI

struct MainMenuView: View {
    @Binding var navigationPath: NavigationPath

    var body: some View {
        VStack(spacing: 20) {
            Text("What would you like to do?")
                .font(.headline)

            Button(action: {
                navigationPath.append("builder")
            }) {
                Text("Build New Routine")
                    .font(.title2)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
            .padding(.horizontal)

            Button(action: {
                navigationPath.append("saved")
            }) {
                Text("Saved Routines")
                    .font(.title2)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.gray.opacity(0.2))
                    .foregroundColor(.black)
                    .cornerRadius(12)
            }
            .padding(.horizontal)

            Spacer()
        }
        .padding()
        .navigationTitle("Loosen Up")
    }
}
