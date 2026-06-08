//
//  Conversation 2.swift
//  eLearning_CDA
//
//  Created by Apprenant 77 on 05/06/2026.
//


import Foundation

struct Conversation: Identifiable {
    //identifiant unique automatique
    let id = UUID()
    let text: String
    let isMe: Bool
}
