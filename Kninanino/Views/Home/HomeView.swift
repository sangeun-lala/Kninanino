//
//  HomeView.swift
//  Kninanino
//
//  Created by Sang-eun Cho on 2025/03/01.
//

import SwiftUI
import SwiftData
import FirebaseAuth

struct HomeView: View {
    
    @EnvironmentObject var authVM: AuthViewModel
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading) {
                
                if let user = Auth.auth().currentUser {
                    Text("Welcome back, \(user.email ?? "knitter") 🧶")
                        .font(.largeTitle)
                        .padding()
                }
                
                Text("Here’s your knitting dashboard.")
                    .padding(.bottom)
                
                Text("Carousels for each level will be shown here.\n\n- Beginner projects\n- Intermediate projects\n- Advanced projects")
                    .padding(.bottom)
                
                Text("Features: 1) Filter views for friends only.\n2) Show only favorites.\n3) Filter for tags")
                    .padding(.bottom)
                
                
                Button("Sign Out") {
                    authVM.signOut()
                }
                    .padding()
                    .background(Color.black)
                    .foregroundStyle(.white)
                    .cornerRadius(10)
                    .shadow(radius: 3)
            }
        }
    }
}

#Preview {
   HomeView()
}
