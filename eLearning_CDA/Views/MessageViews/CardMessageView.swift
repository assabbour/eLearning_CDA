//
//  CardMessageView.swift
//  eLearning_CDA
//
//  Created by Apprenant 77 on 04/06/2026.
//

import SwiftUI

struct CardMessageView: View {
    //  let conversation: Message
    let conversations = [
        Message(name: "Colette", lastMessage: "Bonjour", image: "colette"),
        Message(name: "Cyriac", lastMessage: "Merci", image: "Cyriac"),
        Message(name: "Jaouad", lastMessage: "On se voit demain ?", image: "jaouad"),
        Message(name: "Karima", lastMessage: "Merci 👍", image: "karima"),
        Message(name: "Louise", lastMessage: "J’arrive", image: "louise"),
        Message(name: "Theo", lastMessage: "Ok", image: "Theo"),
        Message(name: "Veronique", lastMessage: "Cours ?", image: "veronique"),
        Message(name: "Yann", lastMessage: "Contrôle vendredi", image: "yann")
    ]
    
    var body: some View {
        
        NavigationStack {
                List(conversations) { conversation in
                    NavigationLink {
                        // Ouvre le chat du contact sélectionné
                        ChatView(conversation: conversation)
                    } label: {
                        // Ouvre le chat du contact sélectionné
                        MessageRow(conversation: conversation)
                    }
                   // enlève style iOS par défaut
                    .listStyle(.plain)
                }
            .navigationTitle("Messages")
        }
    }
}
#Preview {
    CardMessageView()
}


