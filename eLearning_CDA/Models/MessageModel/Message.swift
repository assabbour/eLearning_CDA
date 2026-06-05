//
//  Message.swift
//  eLearning_CDA
//
//  Created by Apprenant 77 on 04/06/2026.
//

import Foundation
import SwiftUI

struct Meesage: Identifiable {
    let id = UUID()
    let name: String
    let lastMessage: String
    let image: String
}

struct ConversationRow: View {
   let conversation: Meesage

    var body: some View {
        HStack(spacing: 12) {
            
            Image(conversation.image)
                .resizable()
                   .scaledToFill()
                   .frame(width: 50, height: 50)
                   .clipShape(Circle())

            VStack(alignment: .leading, spacing: 2) {
                Text(conversation.name)
                    .font(.headline)

                Text(conversation.lastMessage)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                   .lineLimit(1)
              
            }
            Spacer()
//pour faire le chevron
         //  Image(systemName: "chevron.right")
           //     .foregroundColor(.gray)
        }
    //.padding(.horizontal)

        .padding(.vertical, 6)
        .background(Color(.systemGray6))
        .cornerRadius(12)
        
    }
}
#Preview {
    CardMessageView()
}



