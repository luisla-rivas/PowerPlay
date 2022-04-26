//
//  LanguagesVM.swift
//  PowerPlay
//
//  Created by Luis Lasierra on 26/4/22.
//

import Foundation

final class LanguagesVM: ObservableObject {
    
    @Published var selectedLanguage: AvailableLanguage
    var availableLanguages: [AvailableLanguage]
    
    let easyLanguages = [
        AvailableLanguage(id: "de", name: "German", nativeName: "Deutsch"),
        AvailableLanguage(id: "es-US", name: "English", nativeName: "English"),
        AvailableLanguage(id: "fr-FR", name: "French", nativeName: "Français"),
        AvailableLanguage(id: "es-ES", name: "Spanish", nativeName: "Español")
    ]
    private(set) var jsonLanguajes = "CodeLanguajes"

    init() {
        self.selectedLanguage = AvailableLanguage(id: "en-EN", name: "English", nativeName: "English")
        guard let url = Bundle.main.url(forResource: jsonLanguajes, withExtension: "json") else {
            availableLanguages = []
            return
        }
        do {
            let jsonData = try Data(contentsOf: url)
            let languages = try JSONDecoder().decode(LanguageDict
.self, from: jsonData)
            self.availableLanguages = languages.keys.map({
                AvailableLanguage(id: $0, name: languages[$0]!.name, nativeName: languages[$0]!.nativeName)}).sorted { $0.name < $1.name }

        } catch {
            print("Loading error \(error)")
            availableLanguages = []
        }
    }
}
