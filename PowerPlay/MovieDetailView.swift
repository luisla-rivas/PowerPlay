//
//  MovieDetailView.swift
//  PowerPlay
//
//  Created by Luis Lasierra on 20/4/22.
//

import SwiftUI

struct MovieDetailView: View {
    
    @EnvironmentObject var genresModel: GenresVM
    
    var movie:Result
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
            
                VStack(alignment: .leading, spacing: 0) {
                    Text(movie.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Text("\(movie.originalName) (\(movie.originalLanguage.rawValue))")
                    Text("\(movie.firstAirDate) (\((movie.originCountry.map{String($0)}).joined(separator: ", ")))").font(.body)
                    //Text((movie.originCountry.map{String($0)}).joined(separator: ", "))
                    //Text(dateFormatter.string(from: (movie.firstAirDate)))
                    ScrollView(.horizontal) {
                        HStack(spacing: 10) {
                            ForEach(movie.genreIDS, id: \.self) { genreCode in
                                Text("\(genresModel.genres.filter({$0.id == genreCode}).first?.name ?? "error")")
                                    .font(.caption)
                                    .padding(5)
                                    .background(.quaternary)
                                    .cornerRadius(8)
    //                                    .border(Color.primary)
                            }
                            
                            
                        }
                        
                    }
                    .padding(.vertical)
                    //Text((movie.genreIDS.map{String($0)}).joined(separator: ", ")).padding()
                    HStack (alignment: .top, spacing: 10) {
                        AsyncImage(url: URL(string:"https://image.tmdb.org/t/p/w500\(movie.posterPath)")) { image in
                            image.resizable()
                                .scaledToFit()
                                .frame(width: min(geometry.size.width, geometry.size.height)/3, alignment: .topLeading)
                                //.clipShape(Circle())
                            } placeholder: {
                                Image(systemName: "film")
                                    .font(.largeTitle)
                            }

                        Text(movie.overview)
                            .font(.caption)
                        Spacer()
                        }
                    
                    
                    PopularityAndRateView(movie: movie, showVotes: true)
                        //.padding(.horizontal)
                    Spacer()
                    //Text("\(min(geometry.size.width, geometry.size.height))")
                }
            }
            
        }
        .padding()
        .navigationTitle(movie.name)
        .navigationBarTitleDisplayMode(.inline)
        .task {
            do {
                try await genresModel.load()
            } catch {
                print("Error: \(error)")
            }
        }

    }
    
    // create a DateFormatter
    let dateFormatter:DateFormatter = {
        let formatter = DateFormatter()
        //formatter.locale = Locale(identifier: "es_ES")
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }()
}



struct MovieDetailView_Previews: PreviewProvider {
              
    static var previews: some View {
        ForEach(["iPhone SE (2nd generation)", "iPhone 13 Pro Max", "iPad Air (5th generation)"], id: \.self) { deviceName in
            MovieDetailView(movie: MoviePagesVM().preview.results[1])
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .environmentObject(GenresVM())
                
        }
    }
}
