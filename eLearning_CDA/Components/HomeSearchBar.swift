//
//  HomeSearchBar.swift
//  eLearning_CDA
//
//  Created by apprenant 108 on 08/06/2026.
//


import SwiftUI
// Composant de la barre de recherche
struct HomeSearchBar: View {
    // Texte provenant de HomeView
    @Binding var searchText: String
    var body: some View {
        HStack {
            // Icône loupe à gauche
            Image(systemName: "magnifyingglass")
            // Champ de saisie
            TextField("Search", text: $searchText)
            // Spacer pousse le micro à droite
            Spacer()
            // Icône micro à droite
            Image(systemName: "mic.fill")
        }
        // Taille du texte et des icônes
        .font(.title3)
        // Couleur des icônes et du texte
        .foregroundColor(.black.opacity(0.65))
        // Espace intérieur gauche et droite
        .padding(.horizontal, 18)
        // Hauteur de la barre
        .frame(height: 58)
        // Fond blanc transparent
        .background(Color.white.opacity(0.82))
        // Forme arrondie comme une capsule
        .clipShape(Capsule())
        // Bordure noire légère
        .overlay(
            Capsule()
                .stroke(Color.black.opacity(0.25), lineWidth: 1)
        )
        // Ombre sous la barre
        .shadow(color: .black.opacity(0.25), radius: 8, x: 0, y: 5)
    }
}
