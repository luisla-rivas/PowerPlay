//
//  PowerPlayApp.swift
//  PowerPlay
//
//  Created by Luis Lasierra on 19/4/22.
//

import SwiftUI

@main
struct PowerPlayApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
