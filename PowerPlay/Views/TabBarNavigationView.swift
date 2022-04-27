//
//  TabBarNavigationView.swift
//  Managed
//
//  Created by Luis Lasierra on 19/1/22.
//

import SwiftUI

enum TabItem {
  case popular, genres, setting
}

struct TabBarNavigationView: View {
  @AppStorage("isOffline", store: .standard) var isOffline: Bool = false
  @State private var selection: TabItem = .popular

  var body: some View {
    TabView(selection: $selection) {
        if !isOffline {
            PopularMoviesListView()
                .tabItem {
                    Label("Popular", systemImage: "list.and.film")
                    }
                .tag(TabItem.popular)

        } else {
            OfflinePopularMoviesListView()
                .tabItem {
                    Label("Popular", systemImage: "list.and.film")
                    }
                .tag(TabItem.popular)
        }
//        GenresListView()
//            .tabItem {
//                Label("Genre", systemImage: "film")
//                }
//            .tag(TabItem.genres)
        
        SettingsView()
            .tabItem {
                Label("Settings", systemImage: "gear")
                }
            .tag(TabItem.setting)
    }
  }
}

struct TabBarNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarNavigationView()
    }
}
