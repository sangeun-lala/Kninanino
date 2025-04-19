//
//  NewJournalView.swift
//  Kninanino
//
//  Created by Sang-eun Cho on 2025/04/09.
//

import SwiftUI

struct NewJournalView: View {
    @StateObject var viewModel = NewJournalViewModel()
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        Group {
            if let currentUser = authViewModel.currentUser {
                VStack{
                    Text("New Journal for \(currentUser.username)")
                    Button("Save Journal") {
                        viewModel.addJournal(for: currentUser.id ?? "")
                    }
                }
            } else {
                ProgressView("Loading user...")
            }
        }
        .onAppear {
            print("🟣 onAppear - user: \(String(describing: authViewModel.user))")
            if authViewModel.currentUser == nil {
                print("🔄 currentUser is nil – trying to fetch again")
                authViewModel.fetchCurrentUser()
            }
        }
    }
}
