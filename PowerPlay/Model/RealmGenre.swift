//
//  RealmGenre.swift
//  PowerPlay
//
//  Created by Luis Lasierra on 27/4/22.
//

import SwiftUI
import RealmSwift

final class RealmGenre: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var language: String
    @Persisted var name: String
 
    /// The backlink to the `Group` this item is a part of.
    @Persisted(originProperty: "genreIDS") var genreIDS: LinkingObjects<RealmMovie>
}
