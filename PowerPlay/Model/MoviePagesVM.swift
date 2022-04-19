//
//  PageMoviesVM.swift
//  PowerPlay
//
//  Created by Luis Lasierra on 19/4/22.
//

import Foundation
import Combine

final class MoviePagesVM: ObservableObject {
    
    @Published var currentPage: MoviePage? = nil
    
    private let urlTMDB = "https://api.themoviedb.org/3/tv/popular?api_key=c6aeee577586ba38e487b74dfede5deb&language=en-US&page="
    
    func carga(_ pageNum: Int) async {
        do {
            currentPage = try await cargaMoviePage(pageNum)
            
        } catch {
            print("Error at loading \(error)")
        }
    }
    
    func cargaMoviePage(_ pagNum: Int) async throws -> MoviePage? {
        guard let url = URL(string: urlTMDB+"\(pagNum)") else {
            return nil
        }
        let (data, response) = try await URLSession.shared.data(from: url)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
              
        return try JSONDecoder().decode(MoviePage.self, from: data)
    }
    
    
    let preview:MoviePage = MoviePage(page: 1,
        results: [
            Result(backdropPath: "/jtER3n8XNzZTuo6ADt7VlyXirPp.jpg",
                 firstAirDate:  "2022-03-30",
                 genreIDS: [10759, 10765, 18],
                 id: 92749,
                 name: "Moon Knight",
                 originCountry: ["US"],
                 originalLanguage: .en,
                 originalName: "Moon Knight",
                 overview: "When Steven Grant, a mild-mannered gift-shop employee, becomes plagued with blackouts and memories of another life, he discovers he has dissociative identity disorder and shares a body with mercenary Marc Spector. As Steven/Marc’s enemies converge upon them, they must navigate their complex identities while thrust into a deadly mystery among the powerful gods of Egypt.",
                 popularity: 7550.11,
                 posterPath: "/x6FsYvt33846IQnDSFxla9j0RX8.jpg",
                 voteAverage: 8.6,
                 voteCount: 308),
            Result(backdropPath: "/1qpUk27LVI9UoTS7S0EixUBj5aR.jpg",
                    firstAirDate: "2022-03-24",
                    genreIDS: [10759, 10765],
                    id: 52814,
                    name: "Halo",
                    originCountry: ["US"],
                      originalLanguage: .en,
                    originalName: "Halo",
                    overview: "Depicting an epic 26th-century conflict between humanity and an alien threat known as the Covenant, the series weaves deeply drawn personal stories with action, adventure and a richly imagined vision of the future.",
                    popularity: 7462.148,
                    posterPath: "/nJUHX3XL1jMkk8honUZnUmudFb9.jpg",
                    voteAverage: 8.7,
                    voteCount: 437)],
        totalPages: 6427,
        totalResults: 128532)
}
