//
//  Task.swift
//  Scavenger Hunt
//
//  Created by sneha siri nagabathula on 9/25/25.
//


import Foundation
import CoreLocation
import UIKit

struct Task: Identifiable {
    let id = UUID()
    var title: String
    var description: String
    var isCompleted: Bool = false
    var attachedPhoto: UIImage? = nil
    var photoLocation: CLLocationCoordinate2D? = nil
}
