//
//  InfoView.swift
//  ChemistryKnowledgeApp
//
//  Created by Dmitrii Varlakhanov on 5/10/26.
//

import SwiftUI

struct InfoView: View {
    let data = PostData.createData()

    var titleOn: Bool
    var sliderBindedValue: Double

    var body: some View {
        if titleOn {
            NavigationView {
                List(data) { post in
                    NavigationLink {
                        InfoDetails(post: post)
                    } label: {
                        InfoRow(post: post, sliderBindedValue: sliderBindedValue)
                    }
                }
                .navigationTitle("Немного о химии")
                .listStyle(.plain)
            }
        } else {
            NavigationView {
                List(data) { post in
                    NavigationLink {
                        InfoDetails(post: post)
                    } label: {
                        InfoRow(post: post, sliderBindedValue: sliderBindedValue)
                    }
                }
                .listStyle(.plain)
            }
        }
    }
}

#Preview {
    InfoView(titleOn: true, sliderBindedValue: 12)
}
