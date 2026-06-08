import SwiftUI

struct ExpertDetailsView: View {

    // On récupère un seul utilisateur depuis le tableau users : le premier utilisateur de ta liste dans User.swift
    let user: User = users[0]
    var body: some View {

        // ZStack pour le fond dégradé derrière + le contenu devant
        ZStack {
            // Fond dégradé de l'écran
            LinearGradient(
                colors: [
                    Color("green_dark"),       // Première couleur depuis Assets
                    Color("green_semi_dark"),  // Deuxième couleur depuis Assets
                    Color("green_semi_light")  // Troisième couleur depuis Assets
                ],
                startPoint: .top,      // Le dégradé commence en haut
                endPoint: .bottom      // Le dégradé finit en bas
            )
            .ignoresSafeArea() // Le fond prend tout l'écran, même sous la notch et la barre du bas

            
            VStack(spacing: 16) {

                // HStack organise le bouton retour à gauche
                HStack {

                    // Bouton retour
                    Button {
                    } label: {
                        // Icône de flèche retour depuis SF Symbols
                        Image(systemName: "chevron.left")
                            .font(.system(size: 25, weight: .bold)) // Taille et graisse de l'icône
                            .foregroundColor(.black) // Couleur de l'icône
                            .frame(width: 54, height: 54) // Taille du bouton
                            .background(Color("green_light")) // Fond du bouton avec ta couleur Asset
                            .clipShape(Circle()) // Transforme le bouton en cercle
                            .overlay(
                                Circle()
                                    .stroke(.black.opacity(0.8), lineWidth: 2) // Bordure noire autour du cercle
                            )
                            .shadow(
                                color: .black.opacity(0.35), // Couleur de l'ombre
                                radius: 6,                   // Flou de l'ombre
                                x: 0,                        // Décalage horizontal
                                y: 4                         // Décalage vertical
                            )
                    }

                    // Spacer pousse le bouton vers la gauche
                    Spacer()
                }
                .padding(.horizontal, 28) // Marge gauche/droite du bouton
                .padding(.top, 18) // Marge en haut

                // On affiche la carte utilisateur
                // On lui donne le user récupéré depuis users[0]
                UserTopCard(user: user)
                    .padding(.horizontal, 28) // Même largeur que les cartes de contenu
                // ScrollView permet de faire défiler les contenus si la liste est longue
                ScrollView(showsIndicators: false) {
                    // VStack pour afficher les cards de contenu les unes sous les autres
                    VStack(spacing: 16) {
                        // ForEach parcourt les contenus appartenant à CE user
                        // user.content vient de la relation One To Many dans User.swift
                        ForEach(user.content) { content in
                            // Pour chaque content, on crée une carte dynamique
                            ContentLessonCard(content: content)
                        }
                    }
                    .padding(.horizontal, 28) // Marge gauche/droite des cards
                    .padding(.bottom, 30) // Marge en bas de la liste
                }
            }
        }
    }
}

// Partie utilisateur

// Vue réutilisable pour afficher la card du user
struct UserTopCard: View {
    let user: User
    var body: some View {
        // HStack image à gauche, infos au centre, boutons à droite
        HStack(spacing: 16) {
            // Image de profil venant des Assets, user.profilPicture contient le nom de l'image
            Image(user.profilPicture)
                .resizable() // Rend l'image redimensionnable
                .scaledToFill() // Remplit bien le cadre sans déformer l'image
                .frame(width: 78, height: 78) // Taille de la photo
                .clipShape(Circle()) // Photo ronde
                .overlay(
                    Circle()
                        .stroke(.black, lineWidth: 2) // Bordure noire autour de la photo
                )

            // VStack pour afficher les textes verticalement
            VStack(alignment: .leading, spacing: 6) {
                // Nom complet dynamique
                Text("\(user.firstName) \(user.lastName)")
                    .font(.system(size: 24, weight: .semibold)) // Style du texte
                    .foregroundColor(.white) // Couleur blanche
                    .lineLimit(1) // Empêche le texte de prendre plusieurs lignes

                // Métier dynamique du user
                Text(user.job)
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.white.opacity(0.9))

                // Années d'expérience dynamiques
                Text("\(user.year) ans d’expérience")
                    .font(.system(size: 13, weight: .medium))
                    .foregroundColor(.white.opacity(0.75))

                // Si typeProfil vaut true, on affiche Certified
                // Si typeProfil vaut false, on ne l'affiche pas
                if user.typeProfil {
                    Text("Certified")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.white)
                        .shadow(
                            color: .orange, // Ombre orange pour l'effet certification
                            radius: 0,
                            x: 2,
                            y: 2
                        )
                }
            }

            // Pousse les boutons complètement à droite
            Spacer()
            // Boutons à droite de la card
            VStack(spacing: 10) {
                // Bouton message
                CircleActionButton(icon: "message.fill")
                // Bouton ajouter / suivre
                CircleActionButton(icon: "person.badge.plus.fill")
            }
        }
        .padding(16) // Espace intérieur de la card
        .frame(maxWidth: .infinity) // La card prend toute la largeur disponible
        .frame(height: 150) // Hauteur fixe de la card user
        .background(Color("green_light").opacity(0.38)) // Fond semi-transparent
        .clipShape(RoundedRectangle(cornerRadius: 24)) // Coins arrondis
        .overlay(
            RoundedRectangle(cornerRadius: 24)
                .stroke(.black.opacity(0.9), lineWidth: 2) // Bordure noire
        )
        .shadow(
            color: .black.opacity(0.45), // Ombre de la card
            radius: 10,
            x: 0,
            y: 6
        )
    }
}

// Card contenu
// Vue réutilisable pour afficher une card de contenu
struct ContentLessonCard: View {
    // Cette card reçoit un Content depuis la boucle ForEach
    let content: Content
    var body: some View {

        // ZStack pour superposer :
        // 1. image du cours
        // 2. dégradé noir
        // 3. textes et likes
        ZStack(alignment: .bottom) {
            // Image de fond du cours depuis Assets
            // content.imageCourse contient le nom de l'image
            Image(content.imageCourse)
                .resizable() // Permet de redimensionner l'image
                .scaledToFill() // Remplit la card sans déformer l'image
                .frame(height: 145) // Hauteur de l'image
                .frame(maxWidth: .infinity) // Prend toute la largeur disponible
                .clipped() // Coupe ce qui dépasse

            // Dégradé noir au-dessus de l'image
            // Il rend les textes lisibles
            LinearGradient(
                colors: [
                    .clear, // Transparent en haut
                    .black.opacity(0.85) // Noir en bas
                ],
                startPoint: .top,
                endPoint: .bottom
            )

            // HStack pour placer :
            // textes à gauche et likes à droite
            HStack(alignment: .bottom) {

                // Textes du contenu
                VStack(alignment: .leading, spacing: 4) {

                    // Titre dynamique du contenu
                    Text(content.title)
                        .font(.system(size: 25, weight: .semibold))
                        .foregroundColor(.white)
                        .lineLimit(1)

                    // Description dynamique
                    Text(content.description)
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(.white.opacity(0.85))
                        .lineLimit(1)

                    // Catégorie dynamique
                    // content.category est un enum
                    // .text transforme .cour en "Cours", .live en "Lives", etc.
                    Text(content.category.text)
                        .font(.system(size: 12, weight: .bold))
                        .foregroundColor(.black)
                        .padding(.horizontal, 10) // Espace gauche/droite du badge
                        .padding(.vertical, 4) // Espace haut/bas du badge
                        .background(Color("green_light")) // Fond du badge
                        .clipShape(Capsule()) // Forme arrondie du badge
                }

                // Pousse les likes à droite
                Spacer()

                // Partie likes
                VStack(spacing: 4) {

                    // Icône coeur
                    Image(systemName: "heart.fill")
                        .font(.system(size: 23))
                        .foregroundColor(.white)

                    // Nombre de likes dynamique
                    Text(content.likes)
                        .font(.system(size: 21, weight: .bold))
                        .foregroundColor(.white)
                }
            }
            .padding(14) // Espace intérieur sur les textes de la card
        }
        .frame(height: 145) // Hauteur totale de la card contenu
        .clipShape(RoundedRectangle(cornerRadius: 18)) // Coins arrondis
        .overlay(
            RoundedRectangle(cornerRadius: 18)
                .stroke(.black.opacity(0.9), lineWidth: 2) // Bordure noire
        )
        .shadow(
            color: .black.opacity(0.55), // Ombre pour donner du relief
            radius: 10,
            x: 0,
            y: 6
        )
    }
}

// Bouton rond
// Bouton rond réutilisable
struct CircleActionButton: View {
    // Nom de l'icône SF Symbols
    let icon: String
    var body: some View {
        // Bouton cliquable
        Button {
        } label: {
            // Icône dynamique
            Image(systemName: icon)
                .font(.system(size: 18, weight: .bold)) // Taille de l'icône
                .foregroundColor(.black) // Couleur de l'icône
                .frame(width: 43, height: 43) // Taille du bouton
                .background(Color("green_light")) // Fond du bouton
                .clipShape(Circle()) // Forme ronde
                .overlay(
                    Circle()
                        .stroke(.black.opacity(0.8), lineWidth: 2) // Bordure noire
                )
                .shadow(
                    color: .black.opacity(0.30), // Ombre légère
                    radius: 5,
                    x: 0,
                    y: 3
                )
        }
    }
}

// Preview pour voir l'écran dans Xcode sans lancer l'application
#Preview {
    ExpertDetailsView()
}
