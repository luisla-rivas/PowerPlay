//
//  Language.swift
//  PowerPlay
//
//  Created by Luis Lasierra on 26/4/22.
//

import Foundation
struct Language {
    var id: String //codigo idioma "es-ES"
}
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Idiom.self, from: jsonData)

import Foundation

// MARK: - WelcomeValue
struct LanguageValue: Codable {
    let name, nativeName: String
}

typealias LanguageDict = [String: LanguageValue]

struct AvailableLanguage: Codable, Identifiable, Hashable {
    let id: String
    let name: String
    let nativeName: String
    
    init(id: String, name: String, nativeName: String) {
        self.id = id
        self.name = name
        self.nativeName = nativeName
    }
    
    init(){
        self.id = "en-US"
        self.name = "English"
        self.nativeName = "English"
    }
}
