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
    @StateObject var genres = GenresVM()
    
    var body: some Scene {
        WindowGroup {
//            GenresListView()
//                .environmentObject(genres)
//
            ContentView(currentNumberPage: 1)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(moviePage)
                .environmentObject(genres)

        }
    }
}
