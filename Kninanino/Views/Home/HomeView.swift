//
//  ContentView.swift
//  Kninanino
//
//  Created by Sang-eun Cho on 2025/03/01.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    var body: some View {
        
        VStack {
            
            
            Image("IntroGorilla")
                .resizable()
                .cornerRadius(10.0)
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fit/*@END_MENU_TOKEN@*/)
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
           
            Text("Kninanino")
                .padding()
            
            Text("Hello and welcome!")
            
        }
    }
    }

#Preview {
   HomeView()
}
