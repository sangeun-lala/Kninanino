//
//  GaugeSwatch.swift
//  Kninanino
//
//  Created by Sang-eun Cho on 2025/04/15.
//


import Foundation

struct GaugeSwatch: Identifiable, Codable {
    let id: String
    let needleSize: String        // e.g., "3.5mm"
    let yarnType: String          // e.g., "Merino DK"
    let stitchesPerInch: Double
    let rowsPerInch: Double
    let notes: String?
}
