//
//  NewJournalView.swift
//  Kninanino
//
//  Created by Sang-eun Cho on 2025/04/09.
//

import SwiftUI

struct NewJournalView: View {
    @StateObject var viewModel = NewJournalViewModel()
    let currentUserID: String
    
    var body: some View {
        VStack{
            Text("New Journal")
            Button("Save Journal") {
                viewModel.addJournal(for: currentUserID)
            }
        }
    }
    
}
