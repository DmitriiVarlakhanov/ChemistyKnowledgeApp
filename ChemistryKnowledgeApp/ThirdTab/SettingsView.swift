//
//  SettingsView.swift
//  ChemistryKnowledgeApp
//
//  Created by Dmitrii Varlakhanov on 5/11/26.
//

import SwiftUI

struct SettingsView: View {

    enum Options: String {
        case firstOption
        case secondOption
        case thirdOption
    }

    @State private var pickerSelection: Options = .secondOption

    @State private var toggle1State: Bool = true
    @State private var toggle2State: Bool = false

    @State private var sliderBindedValue = 50.0

    var body: some View {
        Form {
            Section("Секция 1") {
                Picker("Picker", selection: $pickerSelection) {
                    Text("Option1").tag(Options.firstOption)
                    Text("Option2").tag(Options.secondOption)
                    Text("Option3").tag(Options.thirdOption)
                }
                Toggle("Toggle 1", isOn: $toggle1State)
                Toggle("Toggle 2", isOn: $toggle2State)
            }

            Section("Секция 2") {
                Slider(
                    value: $sliderBindedValue,
                    in: 0...100
                )
            }
        }
    }
}

#Preview {
    SettingsView()
}
