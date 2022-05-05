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
    @AppStorage("selectedLanguage", store: .standard) var selectedLanguage: String = "en"
    @AppStorage("preferredColorScheme") var preferredColorScheme: Int = 0

    @StateObject var moviePage = MoviePagesVM()
    @StateObject var genres = GenresVM()
    @StateObject var lang = LanguagesVM()

    var body: some Scene {
        WindowGroup {
            MainView()
                .preferredColorScheme(ColorScheme.init(
                    .init(rawValue: preferredColorScheme) ?? .light))
                .environment(\.locale, Locale(identifier: selectedLanguage))
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(moviePage)
                .environmentObject(genres)
                .environmentObject(lang)
        }
    }
    
//    enum MyColorSchema: UIUserInterfaceStyle {
//        typealias RawValue = String
//        case light, dark, none
//    }
}
