//
//  InfoView.swift
//  ChemistryKnowledgeApp
//
//  Created by Dmitrii Varlakhanov on 5/10/26.
//

import SwiftUI

struct InfoView: View {
    let data = PostData.createData()

    var body: some View {
        NavigationView {
            List(data) { post in
                NavigationLink {
                    InfoDetails(post: post)
                } label: {
                    InfoRow(post: post)
                }
            }
            .navigationTitle("Немного о химии")
            .listStyle(.plain)
        }
    }
}

#Preview {
    InfoView()
}
