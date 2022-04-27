//
//  RealmPages.swift
//  PowerPlay
//
//  Created by Luis Lasierra on 27/4/22.
//
import Foundation
import RealmSwift

/// Represents a collection of items.
final class RealmPages: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var pages = RealmSwift.List<RealmMoviePage>()
}
