//
//  InfoRow.swift
//  ChemistryKnowledgeApp
//
//  Created by Dmitrii Varlakhanov on 5/10/26.
//

import SwiftUI

struct InfoRow: View {
    var post: Post
    var sliderBindedValue: Double

    var body: some View {
        HStack {
            Image(post.image)
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .frame(width: 60, height: 60)
                .padding(.leading, 12)

            Text(post.title)
                .font(.system(size: sliderBindedValue))

            Spacer()
        }
    }
}

#Preview {
    InfoRow(post: Post(id: UUID(), title: "Testing", decription: "Testing", image: "Image1"), sliderBindedValue: 20)
}
