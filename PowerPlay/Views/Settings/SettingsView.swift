//
//  SettingsView.swift
//  PowerPlay
//
//  Created by Luis Lasierra on 26/4/22.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var lang: LanguagesVM
    
//    @AppStorage("selectedLanguage", store: .standard) var selectedLanguage: String = "en-EN" //lang.defaultLanguage.id
    
    @State private var selected: AvailableLanguage = AvailableLanguage(id: "en-EN", name: "English", nativeName: "English")
    
    var body: some View {
        //List() {
            ScrollView {
                
                List {
                    Text("\(lang.availableLanguages.count)")
                    ForEach(lang.availableLanguages) {
                        availableLanguage in
                        Text(availableLanguage.name)
                    }
                }
//                Text("Language")
//                Picker("Language", selection: $selected) {
//                    ForEach(lang.availableLanguages) {
//                        availableLanguage in
//                        Text(availableLanguage.name)
//                    }
//                }
                
            }
        //}
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .environmentObject(LanguagesVM())
    }
}
