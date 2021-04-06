//
//  Occurrence+CoreDataClass.swift
//  GeofencePOC
//
//  Created by Koison on 05/04/2021.
//
//

import Foundation
import CoreData

public enum occurenceType : String {
    case entered = "entered"
    case left = "left"
}

@objc(Occurrence)
public class Occurrence: NSManagedObject {

}
