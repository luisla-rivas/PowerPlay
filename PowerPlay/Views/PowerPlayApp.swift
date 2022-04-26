//
//  PowerPlayApp.swift
//  PowerPlay
//
//  Created by Luis Lasierra on 19/4/22.
//

import SwiftUI

@main
struct PowerPlayApp: App {
//    let persistenceController = PersistenceController.shared
    
    @StateObject var moviePage = MoviePagesVM()
    @StateObject var genres = GenresVM()
    @StateObject var lang = LanguagesVM()

    var body: some Scene {
        WindowGroup {
//            GenresListView()
//                .environmentObject(genres)

            MainView()
                .preferredColorScheme(.light)
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(moviePage)
                .environmentObject(genres)
                .environmentObject(lang)
        }
    }
}
