//
//  Item.swift
//  Kninanino
//
//  Created by Sang-eun Cho on 2025/04/08.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
