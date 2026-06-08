//
//  ChatInputBar.swift
//  eLearning_CDA
//
//  Created by Apprenant 77 on 08/06/2026.
//Remarque :
//@Binding → utilise .constant(...)
//closure () -> Void → mets un print() ou vide { }
import SwiftUI

struct ChatInputBar: View {
    @Binding var text: String    // connexion avec une autre vue, le texte vient de ChatView
    
    var onSend: () -> Void            //elle sera appelée quandtu cliques sur envoyer
    var body: some View {
        HStack(spacing: 12) {
            Button {
                // camera action
            } label: {
                Image(systemName: "camera.fill")
                    .foregroundColor(.black)   //couleur noire de l’icône
                    .padding(10)              //couleur noire de l’icône
                    .background(Color.gray.opacity(0.2)) //fond gris clair
                    .clipShape(Circle())     //fond gris clair
            }
            
            HStack {
                TextField("Message ...", text: $text)  //champ pour écrire un message $text = binding vers ChatView
                    .padding(8)
                
                Button {
                    // mic action
                } label: {
                    Image(systemName: "mic.fill")
                        .foregroundColor(.gray)
                }
                Button {   //quand tu cliques → appelle la fonction ChatView
                    onSend() //c’est ici que le message est envoyé
                } label: {
                    Image(systemName: "plus")
                        .foregroundColor(.black)
                        .padding(10)
                        .background(Color.gray.opacity(0.2))
                        .clipShape(Circle())
                }
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 10)
            .background(Color.gray.opacity(0.2))
            .clipShape(Capsule()) //fond gris clair
            
            
        }
        .padding()
    }
}

#Preview {
    ChatInputBar(
        text: .constant(""),
        onSend: {
            print("Send tapped")
        }
    )
}
