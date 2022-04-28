//
//  MainView.swift
//  PowerPlay
//
//  Created by Luis Lasierra on 26/4/22.
//

import SwiftUI

struct MainView: View {
    #if os(iOS)
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    #endif

    @ViewBuilder
    var body: some View {
      #if os(iOS)
        if horizontalSizeClass == .compact {
            TabBarNavigationView()  // For iPhone
      }
      else {
          TabBarNavigationView()
        //SidebarNavigationView()  // For iPad
      }
      #else
      //SidebarNavigationView()  // For mac
        .frame(minWidth: 900, maxWidth: .infinity, minHeight: 500, maxHeight: .infinity)
      #endif
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
