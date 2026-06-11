//
//  GalleryCell.swift
//  eLearning_CDA
//
//  Created by apprenant 108 on 11/06/2026.
//

import SwiftUI // Importe SwiftUI

struct GalleryCell: View { // Déclare une cellule de galerie
    
    let imageName: String // Nom de l'image à afficher
    
    let width: CGFloat // Largeur de la cellule
    
    let height: CGFloat // Hauteur de la cellule
    
    var body: some View { // Contenu visuel de la cellule
        
        ZStack { // Superpose l'image et le bouton
            
            Image(imageName) // Charge l'image depuis Assets.xcassets
                .resizable() // Permet à l'image de changer de taille
                .scaledToFill() // Remplit tout le cadre sans déformer l'image
                .frame(width: width, height: height) // Donne une largeur et une hauteur fixes
                .clipped() // Coupe les parties qui dépassent du cadre
            
            Button { // Crée un bouton cliquable
                
                print("Image sélectionnée : \(imageName)")
                // Action exécutée quand on clique sur le bouton
                
            } label: { // Apparence du bouton
                
                Image(systemName: "chevron.right") // Icône flèche vers la droite
                    .font(.system(size: 36, weight: .light)) // Taille et épaisseur de iala flèche
                    .foregroundColor(.black) // Couleur noire de la flèche
                    .frame(width: 65, height: 82) // Taille du bouton ovale
                    .background( // Fond du bouton
                        LinearGradient( // Dégradé du bouton
                            colors: [
                                Color.white.opacity(0.95), // Blanc presque opaque
                                Color.gray.opacity(0.55) // Gris transparent
                            ],
                            startPoint: .topLeading, // Début du dégradé en haut à gauche
                            endPoint: .bottomTrailing // Fin en bas à droite
                        )
                    )
                    .clipShape(Capsule()) // Transforme le bouton en forme ovale
                    .overlay( // Ajoute une bordure autour du bouton
                        Capsule()
                            .stroke(Color.white.opacity(0.8), lineWidth: 1)
                    )
            }
        }
        .frame(width: width, height: height) // Taille finale de la cellule
    }
}


