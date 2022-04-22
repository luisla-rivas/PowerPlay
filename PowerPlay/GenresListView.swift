//
//  GenresListView.swift
//  PowerPlay
//
//  Created by Luis Lasierra on 22/4/22.
//

import SwiftUI

struct GenresListView: View {
    
    @EnvironmentObject var genresModel: GenresVM
    
    var body: some View {
        
        NavigationView {
            
            List(genresModel.genres) { genre in
                Text(genre.name)
                    
            }
            .navigationTitle("Generos")
        }
        .task {
            do {
                try await genresModel.load()
            } catch {
                print("Error: \(error)")
            }
        }
    }
}

struct GenresListView_Previews: PreviewProvider {
    static var previews: some View {
        GenresListView()
            .environmentObject(GenresVM())
    }
}
