//
//  MovieDetailView.swift
//  PowerPlay
//
//  Created by Luis Lasierra on 20/4/22.
//

import SwiftUI

struct MovieDetailView: View {
    //    private var posterImage = Image(systemName: "film")
    
    @EnvironmentObject var genresModel: GenresVM
    @AppStorage("selectedLanguage", store: .standard) var selectedLanguage: String = "en"
    
    var movie:Result
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
            
                VStack(alignment: .leading, spacing: 5) {
                    Text(movie.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Text("\(movie.originalName) (\(movie.originalLanguage))")
                    Text("\(movie.firstAirDate) (\((movie.originCountry.map{String($0)}).joined(separator: ", ")))").font(.body)
                    //Text((movie.originCountry.map{String($0)}).joined(separator: ", "))
                    //Text(dateFormatter.string(from: (movie.firstAirDate)))
                    ScrollView(.horizontal) {
                        HStack(spacing: 10) {
                            ForEach(movie.genreIDS, id: \.self) { genreCode in
                                Text("\(genresModel.genres.filter({$0.id == genreCode}).first?.name ?? String(genreCode))")
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
//                            .onTapGesture {
//                                self.posterImage =
//                                self.showModalView = true
//                                            }

                        Text(movie.overview)
                            .font(.subheadline)
                        Spacer()
                        }
                    
                    
                    PopularityAndRateView(movie: movie, showVotes: true)
                        //.padding(.horizontal)
                    Spacer()
                    //Text("\(min(geometry.size.width, geometry.size.height))")
                }
//                .sheet(isPresented: self.$showModalView){
//                    PosterView(image: Image(systemName: "star"))
//                    }
            }
            
        }
        .padding()
        .navigationTitle(movie.name)
        .navigationBarTitleDisplayMode(.inline)
        .task {
            do {
                try await genresModel.load(language: selectedLanguage)
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
            MovieDetailView(movie: MoviePagesVM().preview.results[0])
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .environmentObject(GenresVM())
                
        }
    }
}
