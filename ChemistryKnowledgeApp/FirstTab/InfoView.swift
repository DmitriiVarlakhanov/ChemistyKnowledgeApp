//
//  InfoView.swift
//  ChemistryKnowledgeApp
//
//  Created by Dmitrii Varlakhanov on 5/10/26.
//

import SwiftUI

struct InfoView: View {
    @Binding var data: [Post]

    var titleOn: Bool
    var sliderBindedValue: Double

    var body: some View {
        if titleOn {
            NavigationView {
                List($data, editActions: .delete) { $post in
                    NavigationLink {
                        InfoDetails(post: $post)
                    } label: {
                        InfoRow(post: $post, sliderBindedValue: sliderBindedValue)
                    }
                }
                .navigationTitle("Немного о химии")
                .listStyle(.plain)
            }
        } else {
            NavigationView {
                List($data, editActions: .delete) { $post in
                    NavigationLink {
                        InfoDetails(post: $post)
                    } label: {
                        InfoRow(post: $post, sliderBindedValue: sliderBindedValue)
                    }
                }
                .listStyle(.plain)
            }
        }
    }
}

#Preview {
    InfoView(data: .constant(PostData.createData()), titleOn: true, sliderBindedValue: 12)
}
