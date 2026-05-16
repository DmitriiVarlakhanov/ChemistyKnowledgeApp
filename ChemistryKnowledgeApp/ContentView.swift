//
//  ContentView.swift
//  ChemistryKnowledgeApp
//
//  Created by Dmitrii Varlakhanov on 5/10/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            InfoView()
                .tabItem {
                    Label(
                        "Инфо",
                        systemImage: "info.bubble"
                    )
                }
            HelloView()
                .tabItem {
                    Label(
                        "Hello",
                        systemImage: "hand.wave"
                    )
                }
            SettingsView()
                .tabItem {
                    Label(
                        "Настройки",
                        systemImage: "gear"
                    )
                }
        }
    }
}

#Preview {
    ContentView()
}
