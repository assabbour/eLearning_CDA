//
//  MessageBubble.swift
//  eLearning_CDA
//
//  Created by Apprenant 77 on 08/06/2026.
//

import SwiftUI

struct MessageBubble: View {
    let message: Conversation
    
    var body: some View {
        HStack {
            if message.isMe { Spacer() }// Si c'est mon message, on ajoute un espace à gauche, pour pousser la bulle vers la droite
            
            Text(message.text)
                .padding()
            // vert si c'est moi, gris si c'est l'autre personne
                .background(message.isMe ? Color.green.opacity(0.8) : Color.gray.opacity(0.5))
            
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 18)) // Forme arrondie de la bulle
            
                .frame(maxWidth: 260, alignment: message.isMe ? .trailing : .leading)
            // Largeur maximale de la bulle, et alignement selon l'expéditeur
            
            if !message.isMe { Spacer() } // Si ce n'est pas mon message, on ajoute un espace à droite, pour pousser la bulle vers la gauche
        }
    }
}

#Preview {
    MessageBubble(
        message: Conversation(text: "Salut", isMe: true)
    )
}
