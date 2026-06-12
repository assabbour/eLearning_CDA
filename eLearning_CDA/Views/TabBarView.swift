//
//  TabBarView.swift
//  eLearning_CDA
//
//  Created by apprenant92 on 12/06/2026.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Accueil", systemImage: "house")
                }

            ListLessonsCardView()
                .tabItem {
                    Label("Leçons", systemImage: "book.pages.fill")
                }
            
            ListLessonsCardView()
                .tabItem {
                    Label("Jeux", systemImage: "gamecontroller.circle.fill")
                }
            
            CardMessageView()
                .tabItem {
                    Label("Messages", systemImage: "message.fill")
                }
            
            GalleryView()
                .tabItem {
                    Label("Posts", systemImage: "photo.fill")
                }

        }
    }

}

#Preview {
    TabBarView()
}
