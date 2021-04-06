//
//  GeofenceTrackerTests.swift
//  GeofencePOCTests
//
//  Created by Koison on 05/04/2021.
//

import CoreData
import XCTest
@testable import GeofencePOC

class GeofenceTrackerTests: XCTestCase {
    func testAddGeofenceEntry() {
        let type = occurenceType.entered
        let tracker = TestGeofenceTracker()
        tracker.addGeofenceEntry(with: type)
        let service = tracker.service as! TestDataService
        XCTAssert(service.values.count > 0)
    }
}

class TestGeofenceTracker: GeofenceTracker {
    init() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        super.init(with: context)
        service = TestDataService()
    }
}

class TestDataService : DataServiceProtocol {
    var values : [AnyHashable: Any]
    init() {
        values = [:]
    }
    func saveData(entity: NSManagedObject) {
        values = ["data" : entity]
    }
    
}
