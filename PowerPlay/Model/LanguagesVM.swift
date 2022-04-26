//
//  LanguagesVM.swift
//  PowerPlay
//
//  Created by Luis Lasierra on 26/4/22.
//

import Foundation

final class LanguagesVM: ObservableObject {
    let defaultLanguage = AvailableLanguage(id: "en-EN", name: "English", nativeName: "English")
    private(set) var jsonLanguajes = "CodeLanguajes"
    
    @Published var selectedLanguage: AvailableLanguage = AvailableLanguage(id: "en-EN", name: "English", nativeName: "English")

    var availableLanguages: [AvailableLanguage]!
    private var languages: LanguageDict!
          
    init() {
        guard let url = Bundle.main.url(forResource: "jsonLanguajes", withExtension: "json") else {
            languages = [:]
            return
        }
        do {
            let jsonData = try Data(contentsOf: url)
            self.languages = try JSONDecoder().decode(LanguageDict
.self, from: jsonData)
            self.availableLanguages = languages.keys.map({
                AvailableLanguage(id: $0, name: languages[$0]!.name, nativeName: languages[$0]!.nativeName)}).sorted { $0.name < $1.name }
        } catch {
            print("Loading error \(error)")
            languages = [:]
        }
    }
}
