//
//  ContentView.swift
//  PowerPlay
//
//  Created by Luis Lasierra on 19/4/22.
//

import SwiftUI
import CoreData


struct PopularMoviesListView: View {
//    @Environment(\.managedObjectContext) private var viewContext
//
//
//
//    @FetchRequest(
//        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
//        animation: .default)
    //private var items: FetchedResults<Item>
    @EnvironmentObject var moviePage: MoviePagesVM
    @AppStorage("selectedLanguage", store: .standard) var selectedLanguage: String = "en"
    
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
                   Text("\(moviePage.currentPage.page)/\(moviePage.currentPage.totalPages)")
                   //Text("\(currentNumberPage)")
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
            do {
                try await moviePage.load(currentNumberPage,
                                language: selectedLanguage)
                print("moviePage.load in PopularMoviesListView")
            } catch {
                print("Error in task PopularMovies: \(error)")
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

//private let itemFormatter: DateFormatter = {
//    let formatter = DateFormatter()
//    formatter.dateStyle = .short
//    formatter.timeStyle = .medium
//    return formatter
//}()

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        PopularMoviesListView(currentNumberPage: $currentNumberPage)
////            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
//            .environmentObject(MoviePagesVM())
//    }
//}
