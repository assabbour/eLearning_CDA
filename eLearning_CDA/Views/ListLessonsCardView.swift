//
//  ListLessonCardView.swift
//  AppEducation
//
//  Created by apprenant92 on 03/06/2026.
//

import SwiftUI

struct ListLessonsCardView: View {
    var body: some View {
        ZStack {
            ExtViewGradient()
            VStack {
                Text("Leçons")
                    .font(.largeTitle)
                    .padding(.top, 30)
                ExtViewSearchBar()
                Spacer()
            }
        }
    }
}

#Preview {
    ListLessonsCardView()
}
