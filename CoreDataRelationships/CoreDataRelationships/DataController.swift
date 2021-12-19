//
//  DataController.swift
//  CoreDataRelationships
//
//  Created by f on 19.12.2021.
//

import CoreData
import Foundation

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "RelationshipData")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Failed to load data, \(error.localizedDescription)")
            }
        }
        self.container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
    }
}
