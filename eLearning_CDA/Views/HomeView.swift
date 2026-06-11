//
//  HomeView.swift
//  eLearning_CDA
//
//  Created by apprenant 108 on 08/06/2026.
//


import SwiftUI
struct HomeView: View {

    // Ce que tape l'utilisateur
    @State private var searchText = ""

    // Résultat filtré
    var filteredContents: [Content] {
        // Si rien n'est saisi
        if searchText.isEmpty {
            return contents
        }
        // Recherche dans le titre
        return contents.filter {
            $0.title.localizedCaseInsensitiveContains(searchText)
        }
    }

    var body: some View {

        ZStack {

            LinearGradient(
                colors: [
                    Color("green_dark"),
                    Color("green_semi_dark"),
                    Color("green_light")
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            ScrollView {

                VStack(alignment: .leading, spacing: 32) {

                    // Barre de recherche
                    HomeSearchBar(searchText: $searchText)

                    // Academy
                    Text("Academy")
                        .font(.system(size: 36))
                        .foregroundColor(.white)

                    ScrollView(.horizontal, showsIndicators: false) {

                        HStack(spacing: 18) {

                            ForEach(
                                filteredContents.filter {
                                    $0.category == .course
                                }
                            ) { item in

                                HomeCourseCard(content: item)
                            }
                        }
                    }

                    // Games
                    Text("Games")
                        .font(.system(size: 36))
                        .foregroundColor(.white)

                    ScrollView(.horizontal, showsIndicators: false) {

                        HStack(spacing: 18) {

                            ForEach(
                                filteredContents.filter {
                                    $0.category == .game
                                }
                            ) { item in

                                HomeCourseCard(content: item)
                            }
                        }
                    }

                    // Live
                    Text("Live")
                        .font(.system(size: 36))
                        .foregroundColor(.white)

                    ScrollView(.horizontal, showsIndicators: false) {

                        HStack(spacing: 18) {

                            ForEach(
                                filteredContents.filter {
                                    $0.category == .live
                                }
                            ) { item in

                                HomeCourseCard(content: item)
                            }
                        }
                    }

                    // Quizz
                    Text("Quizz")
                        .font(.system(size: 36))
                        .foregroundColor(.white)

                    ScrollView(.horizontal, showsIndicators: false) {

                        HStack(spacing: 18) {

                            ForEach(
                                filteredContents.filter {
                                    $0.category == .quizz
                                }
                            ) { item in

                                HomeCourseCard(content: item)
                            }
                        }
                    }
                }
                .padding(.horizontal, 24)
                .padding(.top, 55)
                .padding(.bottom, 40)
            }
        }
    }
}

// Preview pour voir l'écran dans Xcode sans lancer l'application
#Preview {
    HomeView()
}
