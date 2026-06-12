//
//  ListLessonCardView.swift
//  AppEducation
//
//  Created by apprenant92 on 03/06/2026.
//

import SwiftUI

struct ListLessonsCardView: View {
    
    var columns = [  GridItem(.flexible(), spacing: 10),
                     GridItem(.flexible(), spacing: 10)]
    
    @State var categoryFilter: Categories? = nil
    
    func fitleredContentsByCategory() -> [Content] {
        
        let allowedCategories: [Categories] = [.course, .live]

           let allowedContents = contents.filter {
               allowedCategories.contains($0.category)
           }
        
        if let categoryFilter {
                return allowedContents.filter { $0.category == categoryFilter }
            } else {
                return allowedContents
            }
        }
    
    
    var body: some View {
        ZStack {
            ExtViewGradient()
            VStack {
                Text("Leçons")
                    .font(.largeTitle)
                    .padding(.top, 30)
                HStack {
                    ExtViewSearchBar()
                }
                    HStack {
                        ForEach([Categories.course, Categories.live], id: \.self) { categories in
                            Button {
                                withAnimation {
                                    if categoryFilter == categories  {
                                        categoryFilter = nil
                                    } else {
                                        categoryFilter = categories
                                    }
                                }
                            } label: {
                                HStack {
                                    Text(categories.text)
                                }
                                .frame(width: 115, height: 30)
                                .padding(8)
                                .background(categoryFilter != categories ? .black :  .white.opacity(0.8))
                                .cornerRadius(20)
                                .foregroundStyle(categoryFilter != categories ? .white : .black)
                                .padding(.horizontal)
                            }
                        }
                    }
                .padding()
                ScrollView(showsIndicators: false) {
                    LazyVGrid(columns: columns) {
                        ForEach(fitleredContentsByCategory()) { content in
                            NavigationLink {
                                CardLessonDetails(content: content, user: users[0])                            } label: {
                                    CardLessonDetails(content: content, user: users[0])
                                }
                        }
                    }
                }
                .padding(.horizontal)
                Spacer()
            }
        }
    }
}
#Preview {
    ListLessonsCardView()
}
