//
//  ErrorTracker.swift
//  GeofencePOC
//
//  Created by Koison on 06/04/2021.
//

import Foundation
import CoreData
import UIKit

protocol ErrorTrackerProtocol {
    func logError(with type: errorType) throws
}


public enum errorType : String {
    case SaveError = "Save Error"
    case OtherError = "Other Error"
}

class ErrorTracker : ErrorTrackerProtocol {
    static let instanceType = ErrorTracker()
    
    func logError(with type: errorType) throws {
        let newOccurrence = Occurrence(context: context)
        newOccurrence.date = Date()
        newOccurrence.type = type.rawValue
        do {
            try self.context.save()
        } catch {
            throw ErrorTrackerType.AppCoreDataError
        }
    }
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
}

enum ErrorTrackerType : Swift.Error
{
    case AppCoreDataError
}
