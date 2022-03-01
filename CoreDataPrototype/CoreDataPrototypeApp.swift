//
//  CoreDataPrototypeApp.swift
//  CoreDataPrototype
//
//  Created by Joshua Rogers on 01/03/2022.
//

import SwiftUI

@main
struct CoreDataPrototypeApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
