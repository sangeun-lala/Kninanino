//
//  WelcomeView.swift
//  Kninanino
//
//  Created by Sang-eun Cho on 2025/04/09.
//



import SwiftUI

struct WelcomeView: View{
    
    @Binding var hasSeenWelcomeScreen: Bool
    
    var body: some View {
        ZStack{
            Color(hex: "#E7D7C4").ignoresSafeArea()
            
            VStack {
                
                Image("IntroGorilla")
                    .resizable()
                    .cornerRadius(10.0)
                    .scaledToFit()
                    .frame(height: 150)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                
                Text("Kninanino 🦍")
                    .padding()
                    .font(.title2)
                
                Text("Hello and welcome!\nThis is your cozy space to track your knitting, find inspo, and connect with knitters nearby. \n\nThe name *Kninanino* comes from a playful chant from my childhood in Seoul, South Korea: \n\n“Ni-na-ni-na-ni-go-ril-la-da.”\n It was how we made fun little choices—just like in knitting.\n\nHope you find joy, creativity, and community here. Happy knitting! 🧶✨\n- Sangeun\n")
                    .padding(.all)
                    .multilineTextAlignment(.center)
                    .frame(width: 320)
                
                Button("Dive In") {
                    withAnimation {
                        hasSeenWelcomeScreen = true //👈 Trigger the app to show LoginView
                    }
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
    WelcomeView(hasSeenWelcomeScreen: .constant(false))
}
