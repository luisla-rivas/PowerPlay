//
//  RealmMoviePage.swift
//  PowerPlay
//
//  Created by Luis Lasierra on 27/4/22.
//

import SwiftUI
import RealmSwift


/// Represents a collection of items.
final class RealmMoviePage: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var currentPage: Int
    @Persisted var results = RealmSwift.List<RealmMovie>()
}



