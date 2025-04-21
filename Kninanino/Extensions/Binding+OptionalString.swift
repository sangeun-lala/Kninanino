//
//  Binding+OptionalString.swift
//  Kninanino
//
//  Created by Sang-eun Cho on 2025/04/21.
//

// left it for using the extension later.

import SwiftUI

extension Binding where Value == String? {
    func asTextFieldBinding(fallback: String = "") -> Binding<String> {
        Binding<String>(
            get: { self.wrappedValue ?? fallback },
            set: { self.wrappedValue = $0.isEmpty ? nil : $0 }
        )
    }
}
