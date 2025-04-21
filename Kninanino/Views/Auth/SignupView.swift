//
//  SignupView.swift
//  Kninanino
//
//  Created by Sang-eun Cho on 2025/04/09.
//

import SwiftUI

struct SignupView: View {
    @EnvironmentObject var authVM: AuthViewModel
    @State private var formData = SignupFormData()

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Group {
                    TextField("Email", text: $formData.email)
                        .autocapitalization(.none)
                        .keyboardType(.emailAddress)

                    SecureField("Password", text: $formData.password)

                    TextField("Username", text: $formData.username)
                    TextField("Display Name", text: $formData.displayName)

                    Picker("Experience Level", selection: $formData.level) {
                        Text("Beginner").tag("Beginner")
                        Text("Intermediate").tag("Intermediate")
                        Text("Advanced").tag("Advanced")
                    }
                    .pickerStyle(SegmentedPickerStyle())

                    TextField("Bio (optional)", text: Binding<String>(
                        get: { formData.bio ?? "" },
                        set: { formData.bio = $0 }
                    ))

                    TextField("Homebase (optional)", text: Binding<String>(
                        get: { formData.homebase ?? "" },
                        set: { formData.homebase = $0 }
                    ))

                }

                Button("Create Account") {
                    authVM.signUp(with: formData)
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)

                if let message = authVM.authMessage {
                    Text(message).foregroundColor(.green)
                }

                if let error = authVM.errorMessage {
                    Text(error).foregroundColor(.red)
                }
            }
            .padding()
        }
    }
}
