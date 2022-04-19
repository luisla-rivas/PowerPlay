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
    @StateObject var moviePage = MoviePagesVM()
    var body: some Scene {
        WindowGroup {
            ContentView(currentNumberPage: 1)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(moviePage)
        }
    }
}
