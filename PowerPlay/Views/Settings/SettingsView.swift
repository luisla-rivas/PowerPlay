//
//  SettingsView.swift
//  PowerPlay
//
//  Created by Luis Lasierra on 26/4/22.
//

import SwiftUI

struct SettingsView: View {
    
    @EnvironmentObject var languageModel: LanguagesVM
    
    
    var body: some View {
        NavigationView {
            List {
                Picker("Language", selection: $languageModel.selectedLanguage) {
                    ForEach(languageModel.easyLanguages) { availableLanguage in
                        Text(availableLanguage.name).tag(availableLanguage)// as AvailableLanguage)
                    }
                }
            }
//            List(languageModel.easyLanguages) { availableLanguage in
//                    HStack {
//                        Text(availableLanguage.name)
//                        Spacer()
//                        Text("\(availableLanguage.id)")
//                            .font(.caption)
//                            .foregroundColor(.gray)
//                        Spacer()
//                        Text(availableLanguage.nativeName)
//
//                    }
//
//            }
            .navigationTitle("Settings")
        }

        }

}

////                Text("Language")
////                Picker("Language", selection: $languageModel.selec) {
////                    ForEach(lang.availableLanguages) {
////                        availableLanguage in
////                        Text(availableLanguage.name)
////                    }
////                }


struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .environmentObject(LanguagesVM())
    }
}
