//
//  CardMessageView.swift
//  eLearning_CDA
//
//  Created by Apprenant 77 on 04/06/2026.
//

import SwiftUI

struct ConversationsView: View {

    let conversations = [
        Meesage(name: "Colette", lastMessage: "Bonjour", image: "colette"),
        Meesage(name: "Cyriac", lastMessage: "Merci", image: "Cyriac"),
        Meesage(name: "Jaouad", lastMessage: "On se voit demain ?", image: "jaouad"),
        Meesage(name: "Karima", lastMessage: "Merci 👍", image: "karima"),
        Meesage(name: "Louise", lastMessage: "J’arrive", image: "louise"),
        Meesage(name: "Theo", lastMessage: "Ok", image: "Theo"),
        Meesage(name: "Veronique", lastMessage: "Cours ?", image: "veronique"),
        Meesage(name: "Yann", lastMessage: "Contrôle vendredi", image: "yann")
    ]

    var body: some View {

        NavigationStack {
            ZStack {
                List(conversations) { conversation in
                    NavigationLink {
                        Text("Conversation avec \(conversation.name)")
                    } label: {
                        ConversationRow(conversation: conversation)
                    }
                    .listRowBackground(Color.clear)
                }
                .scrollContentBackground(.hidden)
            }
            .navigationTitle("Messages")
        }
    }
}
#Preview {
    ConversationsView()
}


