//
//  GaugeSwatch.swift
//  Kninanino
//
//  Created by Sang-eun Cho on 2025/04/15.
//


import Foundation
import FirebaseFirestore

struct GaugeSwatch: Identifiable, Codable {
    @DocumentID var id: String?
    var needleSize: String        // e.g., "3.5mm"
    var yarnType: String          // e.g., "Merino DK"
    var stitchesPer: Double
    var rowsPer: Double
    var notes: String?
    var projectId: String
}
