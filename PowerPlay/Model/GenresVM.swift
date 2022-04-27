//
//  GenresVM.swift
//  PowerPlay
//
//  Created by Luis Lasierra on 21/4/22.
//

import Foundation
import Combine

class GenresVM: ObservableObject {
    
    private(set) var urlGenre = "https://api.themoviedb.org/3/genre/movie/list?"
    private let apiKey = "c6aeee577586ba38e487b74dfede5deb"
    
    @Published var genres: [Genre] = []

    func load(language: String) async throws {
        do {
            let urlComplete = urlGenre+"api_key=\(apiKey)&language=\(language)"
            let decodeGenres: Genres = try await fetchData(urlComplete)
            genres = decodeGenres.genres
        } catch {
            print("Error at loading \(error)")
        }
    }

    let preview:[Genre] = [ Genre(id: 28, name: "Action"),
                         Genre(id: 12, name: "Adventure"),
                         Genre(id: 16, name: "Animation"),
                        Genre(id: 35, name: "Animation"),
                        Genre(id: 10765, name: "Animation"),
                        Genre(id: 16, name: "Animation")
                         ]

}
