//
//  ExtViewGradient.swift
//  eLearning_CDA
//
//  Created by apprenant 108 on 08/06/2026.
//

import SwiftUI
struct ExtViewGradient: View {
    var body: some View {
        // Création d'un dégradé vertical
        LinearGradient(
            // Couleurs du dégradé
            colors: [
                Color(red: 0.02, green: 0.12, blue: 0.05),
                Color(red: 0.20, green: 0.50, blue: 0.10)
            ],
            // Début du dégradé
            startPoint: .top,
            // Fin du dégradé
            endPoint: .bottom
        )

        // Le dégradé prend tout l'écran
        .ignoresSafeArea()
    }
}
