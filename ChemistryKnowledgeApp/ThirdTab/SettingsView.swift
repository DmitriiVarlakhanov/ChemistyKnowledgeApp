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

    var dragGesture: some Gesture {
        DragGesture(minimumDistance: 0)
            .onChanged { _ in
                isEditing = true
            }
            .onEnded { _ in
                isEditing = false
            }
    }

    @Environment(\.colorScheme) var colorScheme

    @Binding var titleOn: Bool
    @Binding var sliderBindedValue: Double
    @Binding var data: [Post]

    @State private var pickerSelection: Options = .secondOption
    @State private var toggle1State: Bool = true
    @State private var isEditing: Bool = false

    var body: some View {
        Form {

            // MARK: - First section

            Section("Тема приложения") {
                if colorScheme == .light {
                    Text("Light Theme enabled")
                } else {
                    Text("Dark Theme enabled")
                }

                Picker("Picker", selection: $pickerSelection) {
                    Text("Option1").tag(Options.firstOption)
                    Text("Option2").tag(Options.secondOption)
                    Text("Option3").tag(Options.thirdOption)
                }

                Toggle("Toggle 1", isOn: $toggle1State)
            }

            // MARK: - Second section

            Section("Заголовок экрана Инфо") {
                Toggle("Заголовок экрана Инфо", isOn: $titleOn)
                if titleOn {
                    Text("Navigation title enabled")
                        .bold()
                } else {
                    Text("Navigation title disabled")
                        .bold()
                }
            }

            // MARK: - Third section

            Section("Высота строки InfoRow") {
                Text("Перемещайте для изменения высоты")
                    .bold()

                Slider(
                    value: $sliderBindedValue,
                    in: 10...25,
                    step: 1
                ) {
                    Text("!!!")
                } minimumValueLabel: {
                    Text("10")
                } maximumValueLabel: {
                    Text("25")
                }
                .simultaneousGesture(dragGesture)

                if isEditing {
                    InfoRow(
                        post: $data[0],
                        sliderBindedValue: sliderBindedValue
                    )
                }
            }
        }
    }
}

#Preview {
    SettingsView(titleOn: .constant(true), sliderBindedValue: .constant(15), data: .constant(PostData.createData()))
}
