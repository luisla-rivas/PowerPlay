//
//  PageMoviesVM.swift
//  PowerPlay
//
//  Created by Luis Lasierra on 19/4/22.
//

import Foundation
import Combine

final class MoviePagesVM: ObservableObject {
    private let defaultPage = MoviePage(page: 1, results: [], totalPages: 1, totalResults: 0)
    private let urlTMDB = "https://api.themoviedb.org/3/tv/popular?api_key=c6aeee577586ba38e487b74dfede5deb&language=en-US&page="
//    private var currentPage: MoviePage? = nil
    
    @Published var currentPage: MoviePage = MoviePage(page: 1, results: [], totalPages: 1, totalResults: 0)
//    @Published var movies: [Result] = []

    
    func load(_ pageNum: Int) async throws {
        do {
            currentPage = try await cargaMoviePage(pageNum)
            //movies = try await loadMoviePage(pageNum)

            
        } catch {
            print("Error at loading \(error)")
        }
    }
    
    func cargaMoviePage(_ pagNum: Int) async throws -> MoviePage {
        guard let url = URL(string: urlTMDB+"\(pagNum)") else {
            return defaultPage
        }
        let (data, response) = try await URLSession.shared.data(from: url)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
              
        return try JSONDecoder().decode(MoviePage.self, from: data)
    }
    
//    func loadMoviePage(_ pagNum: Int) async throws -> [Result] {
//        guard let url = URL(string: urlTMDB+"\(pagNum)") else {
//            return []
//        }
//        let (data, response) = try await URLSession.shared.data(from: url)
//        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
//            throw URLError(.badServerResponse)
//        }
//        let dataDecode = try JSONDecoder().decode(MoviePage.self, from: data)
////        print("page: \(dataDecode.page), movies:\(dataDecode.results.count) ")
//        return dataDecode.results
//    }
    
    let preview:MoviePage = MoviePage(page: 1,
        results: [
            Result(backdropPath: "/5dJccl3yF1Er6HVZDceYZC3rzhh.jpg",
                    firstAirDate: "2010-08-11",
                    genreIDS: [35, 10765],
                    id: 52698,
                    name: "El Kabeer",
                    originCountry: ["EG"],
                      originalLanguage: "ar",
                    originalName: "الكبير أوي",
                    overview: "The mayor of Al-Mazareeta, earlier in his life, he met an American woman and had twins with her. One child stayed in Egypt while the other went to America . Once he is on his deathbed, his child that grew up in America goes over to Egypt to claim his father's title. The sons battle to see who will take over, but eventually they realize the value of family, and go through challenges together",
                    popularity: 1335.176,
                    posterPath: "/oj4XM6wpGRIcx3QoQx1PF1fx5E5.jpg",
                    voteAverage: 8.8,
                    voteCount: 10),
            Result(backdropPath: "/jtER3n8XNzZTuo6ADt7VlyXirPp.jpg",
                 firstAirDate:  "2022-03-30",
                 genreIDS: [10759, 10765, 18],
                 id: 92749,
                 name: "Moon Knight",
                 originCountry: ["US"],
                 originalLanguage: "en",
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
                      originalLanguage: "en",
                    originalName: "Halo",
                    overview: "Depicting an epic 26th-century conflict between humanity and an alien threat known as the Covenant, the series weaves deeply drawn personal stories with action, adventure and a richly imagined vision of the future.",
                    popularity: 7462.148,
                    posterPath: "/nJUHX3XL1jMkk8honUZnUmudFb9.jpg",
                    voteAverage: 8.7,
                    voteCount: 437),
            Result(backdropPath: "/4g5gK5eGWZg8swIZl6eX2AoJp8S.jpg",
                    firstAirDate: "2003-10-21",
                    genreIDS: [18],
                    id: 11250,
                    name: "Pasión de gavilanes",
                    originCountry: ["CO"],
                      originalLanguage: "es",
                    originalName: "Pasión de gavilanes",
                    overview: "The Reyes-Elizondo's idyllic lives are shattered by a murder charge against Eric and León.",
                    popularity: 2768.128,
                    posterPath: "/lWlsZIsrGVWHtBeoOeLxIKDd9uy.jpg",
                   voteAverage: 7.6,
                    voteCount: 1780),
            Result(backdropPath: "/5GYil2XYeMKzBg7jdIBikoztc2V",
                    firstAirDate: "2022-04-0",
                    genreIDS: [18],
                    id: 195504,
                    name: "From El Haram Street To...",
                    originCountry: ["KW"],
                      originalLanguage: "ar",
                    originalName: "ن شارع الهرم إلى ...",
                    overview: "Unable to return home, a cunning wedding dancer stays back at the groom’s family home but soon gets too comfortable as she tries to gain the upper hand.",
                    popularity: 11340.994,
                    posterPath: "/r5otwc3aMkEHvO4SbUcsDIIAuFT.jpg",
                    voteAverage: 5.1,
                    voteCount: 7)],
        totalPages: 6427,
        totalResults: 128532)
}
