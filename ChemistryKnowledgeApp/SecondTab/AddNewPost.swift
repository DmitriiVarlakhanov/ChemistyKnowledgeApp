//
//  HelloView.swift
//  ChemistryKnowledgeApp
//
//  Created by Dmitrii Varlakhanov on 5/11/26.
//

import SwiftUI
import PhotosUI

struct AddNewPost: View {
    @Binding var data: [Post]

    @State private var textForTitle: String = ""
    @State private var textForDescription: String = ""
    @State private var selectedImage: Image?
    @State private var selectedItem: PhotosPickerItem?

    var body: some View {
        VStack {
            Spacer()

            CustomTextFieldForSwiftUI(text: $textForTitle, placeholder: "Введите название")
                .frame(height: 35)
                .textInputAutocapitalization(.never)
                .padding()

//            TextField("Введите название", text: $textForTitle)
//                .textFieldStyle(.roundedBorder)
//                .textInputAutocapitalization(.never)
//                .padding()

            Divider()

            TextField("Введите описание", text: $textForDescription)
                .textFieldStyle(.roundedBorder)
                .textInputAutocapitalization(.never)
                .padding()

            PhotosPicker("Выберите картинку", selection: $selectedItem, matching: .not(.videos))
                .frame(width: 200, height: 40)
                .background(Color.blue)
                .foregroundStyle(.white)
                .cornerRadius(10)
                .onChange(of: selectedItem) { oldValue, newValue in
                    Task {
                        if let image = try? await selectedItem?.loadTransferable(type: Image.self) {
                            selectedImage = image
                        }
                    }
                }

            Spacer()

            Button("Опубликовать") {
                let post = Post(id: UUID(), title: textForTitle, decription: textForDescription, image: selectedImage ?? Image(""))

                data.append(post)
            }
            .buttonStyle(.bordered)
            .background(Color.blue)
            .foregroundStyle(.white)
            .cornerRadius(10)
            .padding()
        }
    }
}

#Preview {
    AddNewPost(data: .constant(PostData.createData()))
}
