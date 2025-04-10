//
//  ContentView.swift
//  Kninanino
//
//  Created by Sang-eun Cho on 2025/03/01.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    var body: some View {
        VStack {
            Image("wedding")
                .resizable()
                .cornerRadius(10.0)
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fit/*@END_MENU_TOKEN@*/)
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            Text("Welcome to Kninanino App!")
        }
    }
    }

#Preview {
   ContentView()
}
