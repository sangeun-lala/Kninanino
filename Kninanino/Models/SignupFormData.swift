//
//  SignupFormData.swift
//  Kninanino
//
//  Created by Sang-eun Cho on 2025/04/21.
//

import Foundation

struct SignupFormData {
    var email: String = ""
    var password: String = ""
    var username: String = ""
    var displayName: String = ""
    var level: String = "Beginner"
    var bio: String? = nil
    var homebase: String? = nil
    var profilePictureURL: String? = nil
}

extension SignupFormData {
    var isValid: Bool {
        return isEmailValid && isPasswordValid && !username.isEmpty && !displayName.isEmpty
    }

    var isEmailValid: Bool {
        return email.contains("@") && email.contains(".")
    }

    var isPasswordValid: Bool {
        return password.count >= 6
    }

    var validationMessage: String? {
        if !isEmailValid {
            return "Invalid email format."
        }
        if !isPasswordValid {
            return "Password must be at least 6 characters."
        }
        if username.isEmpty || displayName.isEmpty {
            return "All fields must be filled."
        }
        return nil
    }

    static let mock = SignupFormData(
        email: "test@mock.com",
        password: "password",
        username: "mockuser",
        displayName: "Mock User",
        level: "Expert",
        bio: "Knits in coffee shops.",
        homebase: "Paris"
    )

    mutating func reset() {
        self = SignupFormData()
    }

    var resolvedProfilePictureURL: String? {
        return profilePictureURL ?? "https://example.com/default-avatar.png"
    }
}
