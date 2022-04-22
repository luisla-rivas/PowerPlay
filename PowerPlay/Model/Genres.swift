//
//  Genre.swift
//  PowerPlay
//
//  Created by Luis Lasierra on 21/4/22.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct Genres: Codable {
    let genres: [Genre]
}

// MARK: - Genre
struct Genre: Codable, Identifiable {
    let id: Int
    let name: String
}
