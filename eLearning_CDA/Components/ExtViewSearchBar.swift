//
//  ExtViewSearchBar.swift
//  AppEducation
//
//  Created by apprenant92 on 03/06/2026.
//

import SwiftUI

struct ExtViewSearchBar: View {
    
    @State private var showTextField = false
    @State private var searchText: String = ""
    
    var body: some View {
        HStack(spacing: 16) {
            
            Button {
                withAnimation {
                    showTextField.toggle()
                }
            } label: {
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 14, height: 14)
            }
            .frame(width: 50, height: 50)
            .background(.white)
            .cornerRadius(20)
            .shadow(radius: 3, x: 5, y: 5)
            .padding(.leading, 10)
            Spacer()
            
            if showTextField {
                HStack {
                    TextField("Rechercher...", text: $searchText)
//                            Image(systemName: "microphone")
                        .padding()
                        .background(.white)
                        .cornerRadius(12)
                        .shadow(radius: 2)
                        .transition(.move(edge: .top).combined(with: .opacity))
                        .padding(.trailing,10)
                }
            }
        }
    }
}

#Preview {
    ExtViewSearchBar()
}
