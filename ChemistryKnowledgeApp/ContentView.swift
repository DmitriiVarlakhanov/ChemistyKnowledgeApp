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

    @State private var data = PostData.createData()

    @State private var id: UUID?
    @State private var title: String?
    @State private var decription: String?
    @State private var image: String?

    var body: some View {
        TabView {
            InfoView(data: $data, titleOn: titleOn, sliderBindedValue: sliderBindedValue)
                .tabItem {
                    Label(
                        "Инфо",
                        systemImage: "info.bubble"
                    )
                }
            AddNewPost(data: $data)
                .tabItem {
                    Label(
                        "Создать пост",
                        systemImage: "pencil.line"
                    )
                }
            SettingsView(titleOn: $titleOn, sliderBindedValue: $sliderBindedValue, data: $data)
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
