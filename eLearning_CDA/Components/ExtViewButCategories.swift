//
//  ExtViewButCategories.swift
//  AppEducation
//
//  Created by apprenant92 on 02/06/2026.
//

import SwiftUI

struct ExtViewButCategories: View {
    
    @State private var isSelecte = false
//    var enumCategories = Enu
    
    var body: some View {
        Button(action: {
            isSelecte.toggle()
        }) {
            HStack {
                Text ("Transformers 3")
            }
            .frame(width: 145, height: 30)
            .foregroundStyle(isSelecte ? Color.white : Color.black)
            .background(isSelecte ? Color.primary : Color.gray.opacity(0.4))
            .cornerRadius(100)
        }
    }
}

#Preview {
    ExtViewButCategories()
}
