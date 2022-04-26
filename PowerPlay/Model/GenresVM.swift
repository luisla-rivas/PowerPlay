//
//  GenresVM.swift
//  PowerPlay
//
//  Created by Luis Lasierra on 21/4/22.
//

import Foundation
import Combine

final class GenresVM: ObservableObject {
    
    private(set) var urlGenre = "https://api.themoviedb.org/3/genre/movie/list?api_key=c6aeee577586ba38e487b74dfede5deb&language=en-US"

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
  
    func load() async throws {
        do {
            genres = try await loadGenres()

        } catch {
            print("Error at loading \(error)")
        }
    }

    private func loadGenres() async throws -> [Genre] {
        guard let url = URL(string: urlGenre) else {
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
