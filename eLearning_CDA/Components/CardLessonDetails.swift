//
//  StudentCard.swift
//  CorrectionTestTechnique
//
//  Created by Cindy Bajoni on 28/02/2026.
//

import SwiftUI

struct CardLessonDetails: View {
    
    var content: Content
    var user: User
    
    @State private var isLike = false
    
    var body: some View {
        VStack {
            VStack {
                
                Image(content.imageCourse)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 180, height: 100)
                    .clipShape(.rect)
                    .opacity(0.9)
                
                HStack {
                    
                    Image(user.profilPicture)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                        .padding(4)
                    
                    
                    VStack(alignment: .leading) {
                        
                        Text(user.firstName)
                            .font(.callout)
                            .foregroundStyle(.black)
                            .bold()
                        
                        Text(user.userBio)
                            .lineLimit(1)
                            .font(.system(size: 14))
                            .foregroundStyle(.black)
                            .padding(.top, -8)
                    }
                    
                }
                .background(.arrierePlan)
                .clipShape(
                    .rect(
                        topLeadingRadius: 10,
                        bottomLeadingRadius: 10,
                        bottomTrailingRadius: 0,
                        topTrailingRadius: 10
                    )
                )
                .padding(.vertical, 5)
                .padding(.top, -10)
                
                Text(content.description)
                    .font(.system(size: 14))
                    .foregroundStyle(.secondary)
                    .padding(.bottom, 25)
                
            }
            
            .foregroundStyle(.black)
            .frame(width: 180, height: 220)
            .background(.white)
            .cornerRadius(16)
            .shadow(radius: 8)
            
            Button(action: {
                isLike.toggle()
            }) {
                Image(systemName: "heart.fill")
                    .font(.title)
                    .padding()
                    .foregroundStyle(isLike ? .white : .black)
                    .background(isLike ? .black : .white)
                    .cornerRadius(100)
                    .padding(.top, -40)
            }
        }
    }
}

#Preview {
    CardLessonDetails(content: contents[0], user: users[0])
}
