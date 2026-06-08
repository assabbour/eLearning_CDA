//
//  HomeCourseCard.swift
//  eLearning_CDA
//
//  Created by apprenant 108 on 08/06/2026.
//

import SwiftUI

// Composant d'une carte
struct HomeCourseCard: View {

    // La carte reçoit un contenu dynamique
    let content: Content
    var body: some View {
        // ZStack = on empile image + filtre + bouton
        ZStack(alignment: .center) {
            Image(content.imageCourse)
                .resizable()
                .scaledToFill()
                .frame(width: 270, height: 140)
                // Coupe ce qui dépasse
                .clipped()
            // Filtre sombre pour rendre le bouton visible
            Color.black.opacity(0.48)

            // Bouton sur l'image
            Text("Démarrer")
                .font(.title3.bold())
                .foregroundColor(.black)
                .padding(.horizontal, 18)
                .padding(.vertical, 6)
                .background(Color.white.opacity(0.78))
                // Forme arrondie
                .clipShape(Capsule())
                // Position du bouton dans la carte
                .padding()
        }

        // Taille finale de la carte
        .frame(width: 270, height: 140)

        // Coins arrondis de la carte
        .clipShape(RoundedRectangle(cornerRadius: 24))

        // Bordure noire
        .overlay(
            RoundedRectangle(cornerRadius: 24)
                .stroke(Color.black.opacity(0.45), lineWidth: 1.5)
        )

        // Ombre de la carte
        .shadow(color: .black.opacity(0.35), radius: 10, x: 0, y: 6)
    }
}
