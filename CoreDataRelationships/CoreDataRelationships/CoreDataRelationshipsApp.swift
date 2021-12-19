//
//  CoreDataRelationshipsApp.swift
//  CoreDataRelationships
//
//  Created by f on 19.12.2021.
//

import SwiftUI

@main
struct CoreDataRelationshipsApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
