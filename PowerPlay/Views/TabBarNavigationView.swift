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

  @State private var selection: TabItem = .popular

  var body: some View {
    TabView(selection: $selection) {
        PopularMoviesListView()
            .tabItem {
                Label("Popular", systemImage: "list.and.film")
                }
            .tag(TabItem.popular)
        GenresListView()
            .tabItem {
                Label("Genre", systemImage: "film")
                }
            .tag(TabItem.genres)
        
        SettingsView()
            .tabItem {
                Label("Settings", systemImage: "gear")
                }
            .tag(TabItem.setting)
        
//        ReportView()
//            .tabItem {
//                Label("Reports", systemImage: "doc.text")
//                }
//            .tag(TabItem.report)
//
//        MoreView()
//            .tabItem {
//                Label("More", systemImage: "ellipsis")
//                }
//            .tag(TabItem.more)
    }
  }
}

struct TabBarNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarNavigationView()
    }
}
