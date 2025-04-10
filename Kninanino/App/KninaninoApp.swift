//
//  KninaninoApp.swift
//  Kninanino
//
//  Created by Sang-eun Cho on 2025/04/08.
//

import SwiftUI
import SwiftData
import Firebase
import UIKit


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct KninaninoApp: App {
    
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var authVM = AuthViewModel() // ✅ create the view model
    @State private var hasSeenWelcomeScreen = false
    
    
    var body: some Scene {
        WindowGroup {
            if authVM.user != nil {
                HomeView()
                    .onAppear { print("🔵 Showing HomeView") }
            } else if hasSeenWelcomeScreen {
                LoginView()
                    .onAppear { print("🟠 Showing LoginView") }
            } else {
                WelcomeView(hasSeenWelcomeScreen: $hasSeenWelcomeScreen)
                    .onAppear { print("🟢 Showing WelcomeView") }
            }
        }
        .environmentObject(authVM) // ✅ share it with all views
    }

}
