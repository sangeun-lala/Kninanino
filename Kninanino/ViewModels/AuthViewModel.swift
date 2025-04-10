//
//  AuthViewModel.swift
//  Kninanino
//
//  Created by Sang-eun Cho on 2025/04/08.
//


import Foundation
import FirebaseAuth

class AuthViewModel: ObservableObject {
    @Published var user: User?
    @Published var errorMessage: String?
    @Published var isLoading = false
    @Published var authMessage: String?


    init() {
        //self.user = nil   //for testing the login screen
        self.user = Auth.auth().currentUser
    }

    func signUp(email: String, password: String) {
        self.isLoading = true
        errorMessage = nil
        authMessage = nil
        
        print("📩 Attempting to sign up with email: \(email)")

        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            DispatchQueue.main.async {
                
                self.isLoading = false
                
                if let error = error {
                    print("❌ Sign-up failed: \(error.localizedDescription)")
                    self.errorMessage = error.localizedDescription
                    return
                }
                
                guard let user = result?.user else {
                    print("⚠️ Sign-up succeeded but user is nil.")
                    self.errorMessage = "Unexpected error: user is nil"
                    return
                }
                
                // Send verification email
                user.sendEmailVerification { error in
                    if let error = error {
                        print("Error sending verification email:", error.localizedDescription)
                        self.errorMessage = "Verification email failed. Please try again."
                        return
                    } else {
                        print("Verification email sent to : \(user.email ?? "")")
                        self.authMessage = "Verification email sent! Please check your inbox."
                    }
                }

                // Sign them out immediately
                do {
                    try Auth.auth().signOut()
                    self.user = nil
                } catch {
                    print("Error signing out after sign-up: \(error.localizedDescription)")
                }
                
                //print("✅ Sign-up success: \(user.email ?? "unknown email")")
                //self.user = user
            }
        }
    }

    func signIn(email: String, password: String) {
        self.isLoading = true
        errorMessage = nil
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error in
            DispatchQueue.main.async {
                self?.isLoading = false
                
                if let error = error {
                    print("Failed to sign in:", error.localizedDescription)
                    self?.errorMessage = error.localizedDescription
                    return
                }
                
                guard let user = result?.user else {
                    self?.errorMessage = "Unexpected error: user is nil"
                    return
                }
                
                user.reload { error in
                    if let error = error {
                        self?.errorMessage = "Error checking email verification: \(error.localizedDescription)"
                        return
                    }
                    
                    if !user.isEmailVerified {
                        self?.errorMessage = "Please verify your email before logging in."
                        try? Auth.auth().signOut()
                        return
                    }}
                
                print("✅ Sign-in success: \(user.email ?? "unknown email")")
                self?.user = user
            }
        }}

    func signOut() {
        do {
            try Auth.auth().signOut()
            self.user = nil
        } catch {
            self.errorMessage = "Error signing out: \(error.localizedDescription)"
        }
    }
}

