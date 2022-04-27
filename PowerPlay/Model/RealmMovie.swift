//
//  RealmResult.swift
//  PowerPlay
//
//  Created by Luis Lasierra on 27/4/22.
//

import SwiftUI
import RealmSwift

final class RealmMovie: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var backdropPath: String?
    @Persisted var firstAirDate: String
    @Persisted var genreIDS: Int //RealmSwift.List<RealmGenre>()
    @Persisted var idApi: Int
    @Persisted var name: String
    @Persisted var originCountry: String //no creo array para hacerlo mas facil
    @Persisted var originalLanguage: String
    @Persisted var originalName: String
    @Persisted var overview: String
    @Persisted var popularity: Double
    @Persisted var posterPath: String
    @Persisted var voteAverage: Double
    @Persisted var voteCount: Int
    /// The backlink to the `Group` this item is a part of.
    @Persisted(originProperty: "results") var group: LinkingObjects<RealmMoviePage>
}
///// Represents a collection of items.
//final class RealmMoviePage: Object, ObjectKeyIdentifiable {
//    @Persisted(primaryKey: true) var _id: ObjectId
//    @Persisted var results = RealmSwift.List<RealmResult>()
//}
