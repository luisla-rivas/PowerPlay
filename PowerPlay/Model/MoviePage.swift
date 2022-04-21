//
//  Movie.swift
//  PowerPlay
//
//  Created by Luis Lasierra on 19/4/22.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// https://app.quicktype.io
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(MoviePage.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct MoviePage: Codable {
    let page: Int
    let results: [Result]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Result
struct Result: Codable, Identifiable {
    let backdropPath, firstAirDate: String
    let genreIDS: [Int]
    let id: Int
    let name: String
    let originCountry: [String]
    let originalLanguage: OriginalLanguage
    let originalName, overview: String
    let popularity: Double
    let posterPath: String
    let voteAverage: Double
    let voteCount: Int

    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case firstAirDate = "first_air_date"
        case genreIDS = "genre_ids"
        case id, name
        case originCountry = "origin_country"
        case originalLanguage = "original_language"
        case originalName = "original_name"
        case overview, popularity
        case posterPath = "poster_path"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

enum OriginalLanguage: String, Codable {
    case ar = "ar"
    case en = "en"
    case es = "es"
}



