//
//  File.swift
//  PowerPlay
//
//  Created by Luis Lasierra on 27/4/22.
//

import Foundation

func load<T: Decodable>(_ filename: String) throws -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        return try JSONDecoder().decode(T.self, from: data)
    } catch {
        print("Couldn't parse \(filename) as \(T.self):\n\(error)")
        throw FetchError.badJSON
    }
}



@available(iOS 15.0, *)
 func fetchData<T: Decodable>(_ urlString: String) async throws -> T {
    
     guard let url = URL(string: urlString) else {
         //return
         fatalError("Can not construct URL: \(urlString)")
     }

    let (data, response) = try await URLSession.shared.data(for: URLRequest(url: url))
    guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw FetchError.badRequest }

     do {
         return try JSONDecoder().decode(T.self, from: data)
     } catch {
         
         print("Couldn't parse \(urlString) as \(T.self):\n\(error)")
         throw FetchError.badJSON
     }
}


enum FetchError: Error {
    case badRequest
    case badJSON
}
