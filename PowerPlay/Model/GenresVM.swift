//
//  GenresVM.swift
//  PowerPlay
//
//  Created by Luis Lasierra on 21/4/22.
//

import Foundation
import Combine

final class GenresVM: ObservableObject {
    
    private(set) var urlGenre = "https://api.themoviedb.org/3/genre/movie/list?"
    private let apiKey = "c6aeee577586ba38e487b74dfede5deb"
    
    @Published var genres: [Genre] = []
    
//    init() {
//        Task.init {
//            do {
//                try await load()
//                print("genresModel.load")
//            } catch {
//                print("Error: \(error)")
//            }
//        }
//    }
  
    func load(language: String) async throws {
        do {
            genres = try await loadGenres(language: language)

        } catch {
            print("Error at loading \(error)")
        }
    }

    private func loadGenres(language: String) async throws -> [Genre] {
        let urlComplete = urlGenre+"api_key=\(apiKey)&language=\(language)"
        guard let url = URL(string: urlComplete) else {
            return []
        }
        let (data, response) = try await URLSession.shared.data(from: url)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        let dataDecode = try JSONDecoder().decode(Genres.self, from: data)
        return dataDecode.genres
    }

    
    let preview:[Genre] = [ Genre(id: 28, name: "Action"),
                         Genre(id: 12, name: "Adventure"),
                         Genre(id: 16, name: "Animation"),
                        Genre(id: 35, name: "Animation"),
                        Genre(id: 10765, name: "Animation"),
                        Genre(id: 16, name: "Animation")
                         ]

}
