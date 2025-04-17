//
//  KnittingSpot.swift
//  Kninanino
//
//  Created by Sang-eun Cho on 2025/04/17.
//

import Foundation
import FirebaseFirestore
import CoreLocation

struct KnittingSpot: Identifiable, Codable {
    @DocumentID var id: String?
    var name: String
    var description: String?
    var coordinates: GeoPoint
    var createdAt: Date
    var addedByUserID: String

    // Optional helper for MapKit
    var coordinate2D: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
    }
}
