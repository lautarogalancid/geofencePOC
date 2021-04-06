//
//  GeofenceTracker.swift
//  GeofencePOC
//
//  Created by Koison on 05/04/2021.
//

import Foundation
import CoreData
import UIKit
protocol GeofenceTrackerProtocol {
    func addGeofenceEntry(with type: occurenceType)
}

class GeofenceTracker : GeofenceTrackerProtocol {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    func addGeofenceEntry(with type: occurenceType)  {
        let newOccurrence = Occurrence(context: context)
        newOccurrence.date = Date()
        newOccurrence.type = type.rawValue
        do {
            try self.context.save()
        } catch {
            try? ErrorTracker.instanceType.logError(with: errorType.SaveError)
        }
    }
}
