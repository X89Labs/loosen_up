//
//  WelcomeView.swift
//  Loosen Up
//
//  Created by Geoffrey Belanger on 7/6/25.
//
import SwiftUI

struct WelcomeView: View {
    @Binding var navigationPath: NavigationPath
    @State private var showPhilosophy = false

    var body: some View {
        ZStack {
            Color(.systemBackground).ignoresSafeArea()
            VStack(spacing: 24) {
                Spacer()
                Image("loosen_up_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .shadow(radius: 5)
                VStack(spacing: 4) {
                    Text("Loosen Up")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Text("Stretch smart. No fluff.")
                        .font(.headline)
                        .foregroundColor(.secondary)
                }
                VStack(alignment: .leading, spacing: 8) {
                    Text("• Build your own stretch routines")
                    Text("• Follow along with timers and videos")
                    Text("• Fully offline. No accounts. No tracking.")
                }
                .font(.subheadline)
                .padding(.top, 16)
                .padding(.horizontal)
                Spacer()
                Button("Continue") {
                    navigationPath.append(Route.mainMenu)
                }
                .font(.title2)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(12)
                .padding(.horizontal)
                VStack(spacing: 8) {
                    Button("About X89 Labs") {
                        showPhilosophy = true
                    }
                    .font(.footnote)
                    Image("x89_labs_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 40)
                        .opacity(0.8)
                        .padding(.bottom, 8)
                }
            }
            .sheet(isPresented: $showPhilosophy) {
                PhilosophyView(isPresented: $showPhilosophy)
            }
            .padding()
        }
    }
}





