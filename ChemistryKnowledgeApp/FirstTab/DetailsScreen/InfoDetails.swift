//
//  InfoDetails.swift
//  ChemistryKnowledgeApp
//
//  Created by Dmitrii Varlakhanov on 5/10/26.
//

import SwiftUI

struct InfoDetails: View {
    @Binding var post: Post

    var body: some View {
        VStack {
            post.image
                .resizable()
                .scaledToFill()
                .frame(width: 380, height: 200)
                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 12, height: 12)))
                .padding(10)

            ScrollView(.vertical) {
                Text(post.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(5)

                Divider()

                Text(post.decription)
                    .font(.default)
                    .fontWeight(.regular)
                    .multilineTextAlignment(.leading)
                    .padding(10)

                Spacer()
            }
        }
    }
}

#Preview {
    InfoDetails(post: .constant(Post(
        id: UUID(),
        title: "Testing",
        decription: "Testing Testing Testing Testing Testing Testing Testing Testing",
        image: Image("Image1")
    )
    )
    )
}
