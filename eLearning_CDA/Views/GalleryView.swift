//
//  GalleryView.swift
//  eLearning_CDA
//
//  Created by apprenant 108 on 11/06/2026.
//
import SwiftUI // Importe SwiftUI pour créer l'interface graphique

struct GalleryView: View { // Déclare une vue SwiftUI appelée GalleryView
    
    @State private var searchText = "" // Stocke le texte écrit dans la barre de recherche
    
    let images = [ // Liste des noms des images dans Assets.xcassets
        "ia1", "ia2",
        "ia3", "ia4",
        "ia5", "ia6",
        "ia7", "ia8",
        "ia9", "ia10"
    ]
    
    var body: some View { // Contenu visuel principal de l'écran
        
        GeometryReader { geometry in // Permet de récupérer la largeur et la hauteur de l'écran
            
            let horizontalPadding: CGFloat = 36 // Marge à gauche et à droite de la galerie
            
            let imageWidth = (geometry.size.width - horizontalPadding * 2) / 2
            // Calcule la largeur d'une image
            // Largeur écran - marge gauche - marge droite, puis divisé par 2
            
            let imageHeight = imageWidth * 1.45
            // Calcule la hauteur de l'image
            // Ici l'image est un peu plus haute que large
            
            ZStack { // Superpose les éléments les uns sur les autres
                
                LinearGradient( // Crée un fond avec dégradé
                    colors: [
                        Color(red: 0.01, green: 0.10, blue: 0.04), // Vert foncé en haut
                        Color(red: 0.08, green: 0.22, blue: 0.03)  // Vert un peu plus clair en bas
                    ],
                    startPoint: .top, // Le dégradé commence en haut
                    endPoint: .bottom // Le dégradé finit en bas
                )
                .ignoresSafeArea() // Le fond prend tout l'écran, même sous la barre du haut
                
                VStack(spacing: 25) { // Place les éléments verticalement avec 25 points d'espace
                    
                    searchBar // Affiche la barre de recherche
                    
                    ScrollView { // Permet de faire défiler la galerie
                        
                        LazyVGrid( // Crée une grille verticale optimisée
                            columns: [ // Définit les colonnes de la grille
                                
                                GridItem(.fixed(imageWidth), spacing: 0),
                                // Première colonne avec largeur fixe
                                
                                GridItem(.fixed(imageWidth), spacing: 0)
                                // Deuxième colonne avec largeur fixe
                            ],
                            spacing: 0 // Aucun espace vertical entre les lignes
                        ) {
                            
                            ForEach(filteredImages, id: \.self) { imageName in
                                // Parcourt toutes les images filtrées
                                
                                GalleryCell(
                                    imageName: imageName, // Envoie le nom de l'image
                                    width: imageWidth,    // Envoie la largeur calculée
                                    height: imageHeight   // Envoie la hauteur calculée
                                )
                            }
                        }
                    }
                    .padding(.horizontal, horizontalPadding)
                    // Ajoute une marge gauche et droite à la galerie
                }
                .padding(.top, 35) // Décale le contenu vers le bas
            }
        }
    }
    
    var filteredImages: [String] { // Liste des images après recherche
        
        if searchText.isEmpty { // Si la barre de recherche est vide
            
            return images // On affiche toutes les images
            
        } else { // Sinon
            
            return images.filter { imageName in
                // On garde seulement les images dont le nom contient le texte recherché
                
                imageName.lowercased().contains(searchText.lowercased())
                // Compare sans tenir compte des majuscules/minuscules
            }
        }
    }
    
    var searchBar: some View { // Composant de la barre de recherche
        
        HStack { // Place les éléments horizontalement
            
            Image(systemName: "magnifyingglass") // Icône de loupe
                .font(.system(size: 28)) // Taille de l'icône
                .foregroundColor(.black.opacity(0.7)) // Couleur noire avec transparence
            
            TextField("Search", text: $searchText) // Champ de recherche lié à searchText
                .font(.system(size: 28)) // Taille du texte
                .foregroundColor(.black) // Couleur du texte
            
            Spacer() // Pousse le micro vers la droite
            
            Image(systemName: "mic.fill") // Icône micro
                .font(.system(size: 25)) // Taille du micro
                .foregroundColor(.black.opacity(0.7)) // Couleur noire transparente
        }
        .padding(.horizontal, 20) // Espace intérieur gauche et droite
        .frame(height: 70) // Hauteur de la barre de recherche
        .background(Color.white.opacity(0.78)) // Fond blanc légèrement transparent
        .cornerRadius(35) // Arrondit les coins
        .padding(.horizontal, 28) // Marge extérieure gauche et droite
    }
}

#Preview {
   GalleryView()
}
