//
//  SettingsView.swift
//  PowerPlay
//
//  Created by Luis Lasierra on 26/4/22.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("selectedLanguage", store: .standard) var selectedLanguage: String = "en"
    @AppStorage("isOffline", store: .standard) var isOffline: Bool = false
    @AppStorage("preferredColorScheme") var preferredColorScheme: Int = 0
    @EnvironmentObject var languageModel: LanguagesVM
    
    var body: some View {
        NavigationView {
            List {
                Picker("Language", selection: $selectedLanguage) {
                    ForEach(languageModel.easyLanguages) { availableLanguage in
                        HStack {
                            Text(availableLanguage.name)
//                                .foregroundColor(.primary)
//                            Text(availableLanguage.nativeName)
//                            Spacer()
//                                .foregroundColor(.secondary)
//                            Text(availableLanguage.id)
//                                .foregroundColor(.secondary)
                            
                        }.tag(availableLanguage.id)
                    }
                }
                Toggle(isOn: $isOffline) {
                    Text("Mode Offline")
                }
                Picker("Dark/Light mode", selection: $preferredColorScheme) {
                    Text("Automatic").tag(0)
                    Text("Light").tag(1)
                    Text("Dark").tag(2)
                }
                
            }
            .navigationTitle("Settings")
        }
    }

}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .environmentObject(LanguagesVM())
    }
}
