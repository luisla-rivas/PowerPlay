//
//  OfflinePopularMoviesListView.swift
//  PowerPlay
//
//  Created by Luis Lasierra on 27/4/22.
//

import SwiftUI
import RealmSwift

struct OfflinePopularMoviesListView: View {
    @AppStorage("selectedLanguage", store: .standard) var selectedLanguage: String = "en"
    
    @EnvironmentObject var moviePage: MoviePagesVM
    @ObservedResults(RealmMoviePage.self) var realmMoviePages
    
    @State private var currentNumberPage: Int = 1
    
    var body: some View {
        NavigationView {
           List {
               ForEach(moviePage.currentPage.results) { movie in
                    NavigationLink {
                        MovieDetailView(movie: movie)

                    } label: {
                        AsyncImage(url: URL(string:"https://image.tmdb.org/t/p/w500\(movie.posterPath)")) { image in
                            image.resizable()
                                .scaledToFit()
                                .frame(width: 70, alignment: .leading)
                                //.clipShape(Circle())
                            } placeholder: {
                                Image(systemName: "film")
                                    .font(.largeTitle)
                                    .frame(width: 70, alignment: .center)
                            }


//                        Text(item.timestamp!, formatter: itemFormatter)
                        VStack(alignment: .leading, spacing: 5) {
                            Text(movie.name)
                            Text(movie.originalName)
                                .font(.footnote)
                            PopularityAndRateView(movie: movie, showVotes: false)
                            .font(.footnote)
                        }
                    }
                }
//                .onDelete(perform: deleteItems)
            }
//           .searchable(text: $searchFilter,
//                       collection: $items,
//                       keyPath: \.name) {
//               ForEach(items) { itemsFiltered in
//                   Text(itemsFiltered.name).searchCompletion(itemsFiltered.name)
//               }
//           }
           .navigationTitle("Popular movies")
           .navigationViewStyle(.automatic)
           .toolbar {
               ToolbarItemGroup(placement: .bottomBar) {
                   Button(action: {
                       if currentNumberPage > 1 {
                           currentNumberPage -= 1

                       }
                   }, label: {
                       Image(systemName: "chevron.left")
                   })
                   Spacer()
                   Text("\(currentNumberPage)/\(moviePage.currentPage.totalPages)")
                   Spacer()

                   Button(action: {
                       if currentNumberPage < moviePage.currentPage.totalPages {
                           currentNumberPage += 1
                       }
                   }, label: {
                       Image(systemName: "chevron.right")
                   })
               }

           }
            //Spacer()
        }
        .task(id: currentNumberPage) {
            let filterMoviePages = realmMoviePages.filter( {$0.language == selectedLanguage})
            let totalNumPagesNum = filterMoviePages.count
            if totalNumPagesNum > 0 {
                moviePage.fromDataBase(filterMoviePages[currentNumberPage-1],
                           totalPages: filterMoviePages.count)
            }
        }
    }
/*
    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
 */
}


struct OfflinePopularMoviesListView_Previews: PreviewProvider {
    static var previews: some View {
        OfflinePopularMoviesListView()
    }
}
