//
//  User.swift
//  eLearning_CDA
//
//  Created by apprenant92 on 04/06/2026.
//

import Foundation

struct User: Identifiable

{
    var id = UUID()
    var lastName: String
    var firstName: String
    var profilPicture: String
    var year: Int
    var userBio: String
    var typeProfil: Bool
    var job: String
    var content: [Content] = []
}

