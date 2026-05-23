//
//  ContentView.swift
//  ChemistryKnowledgeApp
//
//  Created by Dmitrii Varlakhanov on 5/10/26.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("titleOn") private var titleOn: Bool = true
    @AppStorage("sliderBindedValue") private var sliderBindedValue: Double = 15

    var body: some View {
        TabView {
            InfoView(titleOn: titleOn, sliderBindedValue: sliderBindedValue)
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
            SettingsView(titleOn: $titleOn, sliderBindedValue: $sliderBindedValue)
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
