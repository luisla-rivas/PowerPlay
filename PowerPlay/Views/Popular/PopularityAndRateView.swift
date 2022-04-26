//
//  PopularityAndRateView.swift
//  PowerPlay
//
//  Created by Luis Lasierra on 20/4/22.
//

import SwiftUI

struct PopularityAndRateView: View {
    let movie: Result
    let showVotes: Bool
    var body: some View {
        VStack {
            HStack {
                Text("Popularity: \(movie.popularity, specifier: "%.0f")")
                Spacer()
                Text("⭑").font(.title2).foregroundColor(.yellow).offset(x: 3, y: -2)
                Text("\(movie.voteAverage, specifier: "%.1f") / 10")
                
                }
            if showVotes {
                HStack {
                    Spacer()
                    Text("Votes: \(movie.voteCount, specifier: "%.0d")")
                        .foregroundColor(.secondary)
                    
                }
            }
        }
    }
}

struct PopularityAndRateView_Previews: PreviewProvider {
    static var previews: some View {
        PopularityAndRateView(movie: MoviePagesVM().preview.results[1],
                              showVotes: true)
            .padding(.horizontal)
            .previewLayout(.fixed(width: 390, height: 50))
    }
}
