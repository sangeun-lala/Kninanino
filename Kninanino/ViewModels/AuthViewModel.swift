//
//  AuthViewModel.swift
//  Kninanino
//
//  Created by Sang-eun Cho on 2025/04/08.
//


import Foundation
import FirebaseAuth
import FirebaseFirestore

class AuthViewModel: ObservableObject {
    @Published var user: User? {
        didSet {
            if user != nil {
                fetchCurrentUser()
            }
        }
    }
    @Published var errorMessage: String?
    @Published var currentUser: AppUser?
    @Published var isLoading = false
    @Published var authMessage: String?


    init() {
        //self.user = nil   //for testing the login screen
        self.user = Auth.auth().currentUser
        if self.user != nil {
            fetchCurrentUser()
        }
    }
    
    
    func fetchCurrentUser() {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let docRef = Firestore.firestore().collection("users").document(uid)
        docRef.getDocument { snapshot, error in
            if let error = error {
                self.errorMessage = "Failed to fetch user: \(error.localizedDescription)"
                return
            }
            
            print("📄 Raw snapshot data: \(String(describing: snapshot?.data()))")
            
            do {
                self.currentUser = try snapshot?.data(as: AppUser.self)
                print("✅ Fetched AppUser: \(self.currentUser?.username ?? "")")
            } catch {
                self.errorMessage = "Failed to decode AppUser: \(error.localizedDescription)"
            }
        }
    }
    
    

    func signUp(with data: SignupFormData) {
        self.isLoading = true
        self.errorMessage = nil
        self.authMessage = nil
        
        print("📩 Attempting to sign up with email: \(data.email)")

        Auth.auth().createUser(withEmail: data.email, password: data.password) { [weak self] result, error in DispatchQueue.main.async {
            guard let self = self else {return}
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
            
            // Create Firestore document
            let newUser = AppUser(
                id: user.uid,
                email: data.email,
                username: data.username,
                displayName: data.displayName,
                level: data.level,
                bio: data.bio,
                homebase: data.homebase,
                profilePictureURL: data.profilePictureURL,
                dateJoined: Date(),
                followersCount: 0,
                followingCount: 0
            )
            
            do {
                try Firestore.firestore().collection("users").document(user.uid).setData(from: newUser) { error in
                    if let error = error {
                        self.errorMessage = error.localizedDescription
                        print("❌ Failed to save user to Firestore: \(error.localizedDescription)")
                    } else {
                        print("✅ Firestore user created successfully")
                    }
                }
            } catch {
                self.errorMessage = error.localizedDescription
                print("❌ Failed to encode user: \(error.localizedDescription)")
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
            
            // Sign out AFTER a short delay to allow email verification & Firestore to complete
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                do {
                    try Auth.auth().signOut()
                    self.user = nil
                } catch {
                    print("Error signing out after sign-up: \(error.localizedDescription)")
                }
            }
            
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
                self?.fetchCurrentUser() // ✅ Fetch AppUser after login
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

