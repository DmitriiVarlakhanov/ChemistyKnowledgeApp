//
//  CustomTextFieldForSwiftUI.swift
//  ChemistryKnowledgeApp
//
//  Created by Dmitrii Varlakhanov on 5/23/26.
//

import SwiftUI
import UIKit

struct CustomTextFieldForSwiftUI: UIViewRepresentable {

    typealias UIViewType = UITextField

    @Binding var text: String

    let placeholder: String

    // MARK: - UIViewRepresentable Protocol implementation

    func makeUIView(context: Context) -> UITextField {
        let textField: UITextField = {
            let textField = UITextField()

            textField.placeholder = placeholder
            textField.borderStyle = .roundedRect

            textField.addTarget(
                context.coordinator,
                action: #selector(Coordinator.textChanged),
                for: .editingChanged
            )

            return textField
        }()

        return textField
    }

    func updateUIView(_ uiView: UITextField, context: Context) {
        if uiView.text != text {
            uiView.text = text
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    // MARK: - Coordinator

    class Coordinator: NSObject, UITextFieldDelegate {
        var customTextFieldForSwiftUI: CustomTextFieldForSwiftUI

        init(_ customTextFieldForSwiftUI: CustomTextFieldForSwiftUI) {
            self.customTextFieldForSwiftUI = customTextFieldForSwiftUI
        }

        @objc func textChanged(_ textField: UITextField) {
            let currentText = textField.text ?? ""

            if customTextFieldForSwiftUI.text != currentText {
                customTextFieldForSwiftUI.text = currentText
            }
        }
    }
}

