//
//  PhilosophyView.swift
//  Loosen Up
//
//  Created by Geoffrey Belanger on 7/6/25.
//

import SwiftUI

struct PhilosophyView: View {
    @Binding var isPresented: Bool

    var body: some View {
        ZStack(alignment: .topTrailing) {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    Text("The X89 Labs Philosophy")
                        .font(.title)
                        .bold()

                    Text("""
X89 Labs builds apps the way they used to be:

- 💾 No tracking  
- 🔐 No accounts  
- 🛠 Fully functional offline  
- 💵 One-time payment, no subscriptions  

We believe software should serve users, not harvest them.

Welcome back to apps that Just Work.
""")
                }
                .padding()
            }
            .navigationTitle("About X89 Labs")

            // Floating close button
            Button(action: {
                isPresented = false
            }) {
                Image(systemName: "xmark.circle.fill")
                    .font(.title2)
                    .foregroundColor(.gray)
                    .padding(16)
            }
        }
    }
}
