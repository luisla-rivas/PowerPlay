//
//  GenresListView.swift
//  PowerPlay
//
//  Created by Luis Lasierra on 22/4/22.
//

import SwiftUI

struct GenresListView: View {
    
    @EnvironmentObject var genresModel: GenresVM
    @AppStorage("selectedLanguage", store: .standard) var selectedLanguage: String = "en"
    
    var body: some View {
        
        NavigationView {
            
            List(genresModel.genres) { genre in
                HStack {
                    Text(genre.name)
                    Text("\(genre.id)")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                    
            }
            .navigationTitle("Generos")
        }
        .task {
            await genresModel.load(language: selectedLanguage)
        }
    }
}

struct GenresListView_Previews: PreviewProvider {
    static var previews: some View {
        GenresListView()
            .environmentObject(GenresVM())
    }
}
