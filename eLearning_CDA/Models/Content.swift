//
//  Content.swift
//  eLearning_CDA
//
//  Created by apprenant92 on 04/06/2026.
//

import Foundation

struct Content: Identifiable {
    var id = UUID()
    var description: String
    var imageCourse: String
    var category: [Categories]
}
