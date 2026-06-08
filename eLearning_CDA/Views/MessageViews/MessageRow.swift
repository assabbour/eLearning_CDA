//
//  MessageRow.swift
//  eLearning_CDA
//
//  Created by Apprenant 77 on 08/06/2026.
//

import SwiftUI

struct MessageRow: View {
    let conversation: Message
    
    var body: some View {
        HStack(spacing: 12) {
            
            Image(conversation.image)
                .resizable()     //Permet de redimensionner l'image
                .scaledToFill()  //Remplit entierement le carde
                .frame(width: 50, height: 50) // taille fixe de l'image
                .clipShape(Circle())// faire l'image ronde
            
            VStack(alignment: .leading, spacing: 2) {
                Text(conversation.name)
                    .font(.headline) // Police plus grande et en gras
                Text(conversation.lastMessage)   // Police plus grande et en gras
                    .font(.subheadline)   // Police plus grande et en gras
                    .foregroundColor(.secondary)
                    .lineLimit(1) // Une seule ligne maximum
                
            }
            Spacer() //le contenu reste collé à gauche.
        }
        .padding(.vertical, 6)
        .background(Color(.systemGray6))
        .cornerRadius(12)
        
    }
}
#Preview {
    MessageRow(conversation: Message(name: "Colette", lastMessage: "Bonjour", image: "colette"))
        .padding()
}



