//
//  Binding+OptionalString.swift
//  Kninanino
//
//  Created by Sang-eun Cho on 2025/04/21.
//

// left it for using the extension later.

import SwiftUI

extension Binding {
    static func unwrap(_ optional: Binding<String?>, defaultValue: String = "") -> Binding<String> {
        Binding<String>(
            get: { optional.wrappedValue ?? defaultValue },
            set: { optional.wrappedValue = $0 }
        )
    }
}
