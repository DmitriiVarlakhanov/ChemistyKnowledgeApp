//
//  Post.swift
//  ChemistryKnowledgeApp
//
//  Created by Dmitrii Varlakhanov on 5/10/26.
//

import Foundation
import SwiftUI

struct Post: Identifiable {

    let id: UUID
    let title: String
    let decription: String
    let image: Image
}
