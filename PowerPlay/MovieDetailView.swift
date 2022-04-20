//
//  MovieDetailView.swift
//  PowerPlay
//
//  Created by Luis Lasierra on 20/4/22.
//

import SwiftUI

struct MovieDetailView: View {
    var movie:Result
    
    var body: some View {
        NavigationView{
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    Text(movie.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Text("\(movie.originalName) (\(movie.originalLanguage.rawValue))")
                    Text("\(movie.firstAirDate), \((movie.originCountry.map{String($0)}).joined(separator: ", "))").font(.body)
                    //Text((movie.originCountry.map{String($0)}).joined(separator: ", "))
                    //Text(dateFormatter.string(from: (movie.firstAirDate)))

                    HStack (alignment: .top, spacing: 0) {
                        AsyncImage(url: URL(string:"https://image.tmdb.org/t/p/w500\(movie.posterPath)")) { image in
                            image.resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 200, alignment: .leading)
                                //.clipShape(Circle())
                            } placeholder: {
                                Image(systemName: "film")
                                    .font(.largeTitle)
                            }
                        VStack{
                            //Text((movie.genreIDS.map{String($0)}).joined(separator: ", ")).padding()
                            ScrollView(.horizontal) {
                                ForEach(movie.genreIDS, id: \.self) { genre in
                                    Text("\(genre)")
                                        .font(.caption)
                                        .padding(4)
//                                        .clipped()
                                        .cornerRadius(5)
                                        .border(Color.primary)
                                }
                            }
                            .padding()
                            Text(movie.overview).font(.caption)
//                            HStack {
//                                Text("Genere")
//                                    .frame(width: 100, height: 70, alignment: .leading)
//
//                                Text((movie.genreIDS.map{String($0)}).joined(separator: ", "))
//                                Spacer()
//                            }
                            Spacer()
                        }.padding()
                    }
                    
                    PopularityAndRateView(movie: movie, showVotes: true).padding(.horizontal)
                    Spacer()
                }
                
            }
            .padding()
//            .navigationTitle(movie.name)
//            .navigationBarTitleDisplayMode(.inline)

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
        MovieDetailView(movie: MoviePagesVM().preview.results[1])
            
    }
}
