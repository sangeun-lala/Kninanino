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
            VStack {
                Text("Welcome back! 🧶")
                    .font(.largeTitle)
                    .padding()
                
                Text("Here’s your knitting dashboard.")
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
