//
//  PowerPlayApp.swift
//  PowerPlay
//
//  Created by Luis Lasierra on 19/4/22.
//

import SwiftUI
import RealmSwift

@main
struct PowerPlayApp: SwiftUI.App {
//    let persistenceController = PersistenceController.shared
//    @AppStorage("apiKey") var apiKey: String = "c6aeee577586ba38e487b74dfede5deb"

    @StateObject var moviePage = MoviePagesVM()
    @StateObject var genres = GenresVM()
    @StateObject var lang = LanguagesVM()

    var body: some Scene {
        WindowGroup {
            MainView()
                .preferredColorScheme(.light)
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(moviePage)
                .environmentObject(genres)
                .environmentObject(lang)
        }
    }
//    func key() -> String {
//        return "c6aeee577586ba38e487b74dfede5deb"
//    }

}
