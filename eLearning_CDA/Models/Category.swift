//
//  Category.swift
//  eLearning_CDA
//
//  Created by apprenant92 on 04/06/2026.
//

import Foundation


enum Categories: Identifiable, CaseIterable {
    case live
    case course // a changer partout dans mon app ...
    case game
    case quizz

    var id: Self { self }

    var text: String {
        switch self {
        case .live: return "Lives"
        case .course: return "Cours"
        case .game: return "Jeux"
        case .quizz: return "Quizz"
        }
    }
}


 
