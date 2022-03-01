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
    
    @Environment(\.scenePhase) var scenePhase

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
        .onChange(of: scenePhase) { _ in
            persistenceController.save()
        }
    }
}
