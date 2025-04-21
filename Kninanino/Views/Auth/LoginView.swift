//
//  LoginView.swift
//  Kninanino
//
//  Created by Sang-eun Cho on 2025/04/08.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var authVM: AuthViewModel
    
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        NavigationView {
            
            if authVM.isLoading {
                ProgressView("Signing in...")
                
            } else {
                
                VStack(spacing: 20) {
                    
                    if let message = authVM.authMessage {
                        Text(message)
                            .foregroundColor(.green)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                    }
                    
                    TextField("Email", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .disableAutocorrection(true)
                        .textInputAutocapitalization(.never)
                        .keyboardType(UIKeyboardType.emailAddress)
                    
                    SecureField("Password", text: $password)
                        .textFieldStyle(.roundedBorder)
                    
                    Button("Sign In") {
                        authVM.signIn(email: email, password: password)
                    }
                    
                    NavigationLink(destination: SignupView()) {
                        Text("Sign Up")
                    }
                    
                    if let error = authVM.errorMessage {
                        Text(error)
                            .foregroundColor(.red)
                    }
                }
                .padding()
            }
        }
    }
}

