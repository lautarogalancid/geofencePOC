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
    
    var context : NSManagedObjectContext
    var service : DataServiceProtocol
    
    init(with context: NSManagedObjectContext) {
        self.context = context
        service = DataService(with: context)
    }

    func addGeofenceEntry(with type: occurenceType) {
        let newOccurrence = Occurrence(context: context)
        newOccurrence.date = Date()
        newOccurrence.type = type.rawValue
        service.saveData(entity: newOccurrence)
    }
}

protocol DataServiceProtocol {
    func saveData(entity: NSManagedObject)
}

class DataService : DataServiceProtocol {
    let context : NSManagedObjectContext

    init(with context: NSManagedObjectContext) {
        self.context = context
    }
    func saveData(entity: NSManagedObject) {
        do {
            try self.context.save()
        } catch {
            try? ErrorTracker.instanceType.logError(with: errorType.SaveError)
        }
        
        do {            let dict = try context.fetch(Occurrence.fetchRequest())
            print("asd")
        } catch {
            
        }
    }
}
