//
//  EnumCategories.swift
//  AppEducation
//
//  Created by apprenant92 on 02/06/2026.
//

import Foundation

enum EnumCategories: Identifiable, CaseIterable {
    case lives
    case cours
    case jeux
    case quizz
    
    var id: Self { self }
    
    var text: String {
        switch self {
        case .lives: return "Lives"
        case .cours: return "Cours"
        case .jeux: return "Jeux"
        case .quizz: return "Quizz"
        }
    }
}
