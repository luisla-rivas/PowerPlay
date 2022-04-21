//
//  ContentView.swift
//  PowerPlay
//
//  Created by Luis Lasierra on 19/4/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
//    @Environment(\.managedObjectContext) private var viewContext
//
//
//
//    @FetchRequest(
//        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
//        animation: .default)
    //private var items: FetchedResults<Item>
    
    @EnvironmentObject var moviePage: MoviePagesVM
    @EnvironmentObject var genresModel: GenresVM
    
    var currentNumberPage: Int
//    private var movies: [Result]
    
    var body: some View {
        NavigationView {
           List {
               ForEach(moviePage.currentPage?.results ?? MoviePagesVM().preview.results) { movie in
                    NavigationLink {
                        MovieDetailView(movie: movie)

                    } label: {
                        AsyncImage(url: URL(string:"https://image.tmdb.org/t/p/w500\(movie.posterPath)")) { image in
                            image.resizable()
                                .scaledToFit()
                                .frame(width: 70, height: 70, alignment: .leading)
                                //.clipShape(Circle())
                            } placeholder: {
                                Image(systemName: "film")
                                    .font(.largeTitle)
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
//            .toolbar {
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    EditButton()
//                }
//                ToolbarItem {
//                    Button(action: addItem) {
//                        Label("Add Item", systemImage: "plus")
//                    }
//                }
//            }
//            Text("Select an item")
            Spacer()
        }
    //TODO: Fix
        .task {
            do {
                try await moviePage.carga(currentNumberPage)
//                movies = moviePage.results
            } catch {
                print("Error: \(error)")
            }
        }
        //TODO: End Fix
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(currentNumberPage: 1)
//            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
            .environmentObject(MoviePagesVM())
    }
}
